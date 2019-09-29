from django.core.paginator import Paginator
from django.views import View

from creatures.models.creature import Creature
from creatures.models.section import Section
from encyclopedia.core.func import get_current_month_number
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
        return self.get_month_by_position(get_current_month_number())

    @staticmethod
    def get_creatures_by_month_number(position):
        return Creature.objects.filter(months__pos=position).order_by('position').prefetch_related('months')

    @staticmethod
    def get_shown_sections():
        return Section.objects.filter(show=True).order_by('pos')

    @staticmethod
    def get_creatures_from_section(section):
        return section.creature_set.all().order_by('pos').prefetch_related('months')

    @staticmethod
    def get_available_creatures_in_section(section):
        return section.creature_set.filter(months__pos=get_current_month_number())

    @staticmethod
    def is_last_month(creature):
        current_month = get_current_month_number()
        next_month = current_month + 1 if current_month < 12 else 1
        if not creature.months.filter(pos=current_month).exists():
            return False
        else:
            return not creature.months.filter(pos=next_month).exists()

    @staticmethod
    def is_first_month(creature):
        current_month = get_current_month_number()
        prev_month = current_month - 1 if current_month > 1 else 12
        if not creature.months.filter(pos=current_month).exists():
            return False
        else:
            return not creature.months.filter(pos=prev_month).exists()

    def get_all_available_creatures_by_section(self, sections):
        result = []
        for section in sections:
            available_creatures = list(self.get_available_creatures_in_section(section))
            new_creatures = []
            old_creatures = []
            for creature in available_creatures:
                if self.is_first_month(creature):
                    creature.banner = 'new'
                    new_creatures.append(creature)
                else:
                    old_creatures.append(creature)

            result.append({
                'name': section.name,
                'creatures': new_creatures+old_creatures,
            })
        return result

    def get_all_last_chance_creatures_list_by_section(self, sections):
        result = []
        for section in sections:
            available_creatures = list(self.get_available_creatures_in_section(section))
            last_chance_creatures = [creature for creature in available_creatures if self.is_last_month(creature)]
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

