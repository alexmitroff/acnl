from django.views import View

from encyclopedia.core.func import get_current_month_number
from encyclopedia.models import Unit, Month, Section


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
    def get_active_units_by_month_number(position):
        return Unit.objects.filter(months__pos=position).order_by('pos').prefetch_related('months')

    @staticmethod
    def get_shown_sections():
        return Section.objects.filter(show=True).order_by('pos')

    @staticmethod
    def get_units_from_section(section):
        return section.unit_set.all().order_by('pos').prefetch_related('months')

    @staticmethod
    def get_active_units_from_section(section):
        return section.unit_set.filter(months__pos=get_current_month_number())

    @staticmethod
    def is_last_month(item):
        current_month = get_current_month_number()
        next_month = current_month + 1 if current_month < 12 else 1
        if not item.months.filter(pos=current_month).exists():
            return False
        else:
            return not item.months.filter(pos=next_month).exists()

    @staticmethod
    def is_first_month(item):
        current_month = get_current_month_number()
        prev_month = current_month - 1 if current_month > 1 else 12
        if not item.months.filter(pos=current_month).exists():
            return False
        else:
            return not item.months.filter(pos=prev_month).exists()

    def get_active_units_list_by_section(self, sections):
        result = []
        for section in sections:
            active_units = list(self.get_active_units_from_section(section))
            new_units = []
            old_units = []
            for item in active_units:
                if self.is_first_month(item):
                    item.banner = 'new'
                    new_units.append(item)
                else:
                    old_units.append(item)

            result.append({
                'name': section.name,
                'units': new_units+old_units,
            })
        return result

    def get_last_chance_units_list_by_section(self, sections):
        result = []
        for section in sections:
            active_units = list(self.get_active_units_from_section(section))
            last_chance_units = [item for item in active_units if self.is_last_month(item)]
            result.append({
                'name': section.name,
                'units': last_chance_units
            })
        return result

    @staticmethod
    def mark_active_month(months, unit):
        for month in months:
            print(f'{month.name}: {unit.months.filter(pk=month.pk).exists()}')
            month.is_active = unit.months.filter(pk=month.pk).exists()
        return months

    def last_month_unit_list(self, sections):
        l_list = []
        active_units = self.get_active_units_by_month_number(get_current_month_number())
        for section in sections:
            section_units = active_units.filter(section=section)
            u_list = []
            for item in section_units:
                if self.is_last_month(item):
                    u_list.append(item)
            l_list.append(u_list)
        return l_list

    def new_unit_list(self, sections):
        l_list = []
        active_units = self.get_active_units_by_month_number(get_current_month_number())
        for section in sections:
            section_units = active_units.filter(section=section)
            u_list = []
            o_list = []
            n_list = []  # new units in this month
            for item in section_units:
                if self.is_first_month(item):
                    n_list.append(item)
                else:
                    o_list.append(item)
            u_list.append(n_list)
            u_list.append(o_list)
            l_list.append(u_list)
        return l_list
