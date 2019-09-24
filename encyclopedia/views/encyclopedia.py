from django.views import View

from encyclopedia.core.func import get_current_month_name, get_current_month_number
from encyclopedia.models import Unit, Month, Section


class EncyclopediaView(View):

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

    def is_last_month(self, item):
        current_month = self.get_month_by_position(get_current_month_number())
        position = current_month.pos + 1
        if position > 12:
            position = 1
        next_month = self.get_month_by_position(position)

        months = item.months.all().order_by('pos')

        if current_month not in months:
            return False
        else:
            if next_month not in months:
                return True
            return False

    def is_first_month(self, item):
        current_month = self.get_month_by_position(get_current_month_number())
        position = current_month.pos - 1
        if position < 1:
            position = 12
        prev_month = self.get_month_by_position(position)

        months = item.months.all().order_by('pos')

        if current_month not in months:
            return False
        else:
            if prev_month not in months:
                return True
            return False

    def get_active_units_by_section(self, sections):
        result = {}
        active_units = self.get_active_units_by_month_number(get_current_month_number())
        for section in sections:
            section_units = active_units.filter(section=section)
            result[section.id] = {
                'new': [],
                'leaving': [],
                'normal': []
            }

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
