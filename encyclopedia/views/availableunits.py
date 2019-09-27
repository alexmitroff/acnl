from django.shortcuts import render

from encyclopedia.views.encyclopediabase import EncyclopediaBase


class AvailableUnitsView(EncyclopediaBase):

    def get(self, request):
        sections = self.get_shown_sections()
        sections = self.get_all_available_creatures_by_section(sections)
        mon = self.get_current_month()
        context = {
            'sections': sections,
            'mon': mon,
            # Additional #
            'page_title': f'Available in {mon}',
            'meta_description': ''
        }
        return render(request, 'pages/creatures.html', context)