from django.shortcuts import render

from encyclopedia.views.encyclopediabase import EncyclopediaBase


class LastChanceUnitsView(EncyclopediaBase):

    def get(self, request):
        sections = self.get_shown_sections()
        sections = self.get_all_last_chance_creatures_list_by_section(sections)
        mon = self.get_current_month()
        context = {
            'sections': sections,
            'mon': mon,
            # Additional #
            'page_title': f'{mon} last chance',
            'meta_description': ''
        }
        return render(request, 'pages/units.html', context)