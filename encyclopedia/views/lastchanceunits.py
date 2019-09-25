from django.shortcuts import render

from encyclopedia.views.encyclopedia import EncyclopediaView


class LastChanceUnitsView(EncyclopediaView):

    def get(self, request):
        sections = self.get_shown_sections()
        sections = self.get_last_chance_units_list_by_section(sections)
        mon = self.get_current_month()
        context = {
            'sections': sections,
            'mon': mon,
            # Additional #
            'page_title': f'{mon} last chance',
            'meta_description': ''
        }
        return render(request, 'pages/units.html', context)