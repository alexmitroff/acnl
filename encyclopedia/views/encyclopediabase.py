from django.db.models import Count, Q
from django.core.paginator import Paginator
from django.views import View

from creatures.models.creature import Creature
from creatures.models.section import Section
from encyclopedia.core.month import month
from encyclopedia.models import Month


class EncyclopediaBase(View):
    """Base class for encyclopedia views

    public methods:
    - get_month_by_position
    - get_current_month
    - get_active_units_by_month_number
    - get_shown_sections
    - get_units_from_section
    - get_active_units_from_section
    - is_last_month
    - is_first_month
    - get_active_units_list_by_section
    - get_last_chance_units_list_by_section
    - mark_active_month
    """

    @staticmethod
    def get_month_by_position(position):
        return Month.objects.get(pos=position)

    def get_current_month(self):
        return self.get_month_by_position(month.current)

    @staticmethod
    def get_creatures_by_month_number(position):
        return Creature.objects.filter(months__pos=position).order_by('position').prefetch_related('months')

    @staticmethod
    def get_shown_sections():
        return Section.objects.filter(show=True).order_by('pos')

    @staticmethod
    def get_creatures_from_section(section):
        return section.creature_set.all().order_by('position')

    @staticmethod
    def get_available_creatures_in_section(section):
        return section.creature_set.filter(months__pos=month.current)

    @staticmethod
    def annotate_creatures(queryset):
        return queryset.annotate(
            is_available_this_month=Count('months', filter=Q(months__pos=month.current)),
            will_be_in_next_month=Count('months', filter=Q(months__pos=month.next)),
            was_in_previous_month=Count('months', filter=Q(months__pos=month.previous)),
        )

    @staticmethod
    def is_last_month(creature):
        current_month = month.current
        next_month = current_month + 1 if current_month < 12 else 1
        if not creature.months.filter(pos=current_month).exists():
            return False
        else:
            return not creature.months.filter(pos=next_month).exists()

    @staticmethod
    def is_first_month(creature):
        current_month = month.current
        prev_month = current_month - 1 if current_month > 1 else 12
        if not creature.months.filter(pos=current_month).exists():
            return False
        else:
            return not creature.months.filter(pos=prev_month).exists()

    def get_all_available_creatures_by_section(self, sections):
        result = []
        for section in sections:
            available_creatures = self.get_available_creatures_in_section(section)
            available_creatures = self.annotate_creatures(available_creatures)

            result.append({
                'name': section.name,
                'creatures': available_creatures,
            })
        return result

    def get_all_last_chance_creatures_list_by_section(self, sections):
        result = []
        for section in sections:
            available_creatures = self.get_available_creatures_in_section(section)
            available_creatures = self.annotate_creatures(available_creatures)
            last_chance_creatures = available_creatures.filter(will_be_in_next_month__lt=1)
            result.append({
                'name': section.name,
                'creatures': last_chance_creatures
            })
        return result

    @staticmethod
    def mark_active_month(months, creature):
        for month in months:
            month.is_active = creature.months.filter(pk=month.pk).exists()
        return months

    @staticmethod
    def get_creature_paginator(creatures, per_page=18):
        return Paginator(creatures, per_page)

