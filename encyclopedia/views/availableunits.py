from django.shortcuts import render

from encyclopedia.views.encyclopedia import EncyclopediaView


class AvailableUnitsView(EncyclopediaView):

    def get(self, request):
        sections = self.get_shown_sections()
        sections = self.get_active_units_list_by_section(sections)
        mon = self.get_current_month()
        context = {
            'sections': sections,
            'mon': mon,
            # Additional #
            'page_title': f'Available in {mon}',
            'meta_description': ''
        }
        return render(request, 'pages/units.html', context)