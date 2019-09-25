from django.shortcuts import render

from encyclopedia.core.func import slice_units_from_section
from encyclopedia.views.encyclopediabase import EncyclopediaBase


class EncyclopediaView(EncyclopediaBase):

    def get(self, request):
        sections = []
        for section in self.get_shown_sections():
            sections.append({
                'name': section.name,
                'units': slice_units_from_section(section)
            })
        context = {
            'sections': sections,
            'mon': self.get_current_month(),
            # Additional #
            'page_title': 'Encyclopedia',
            'meta_description': ''
        }
        return render(request, 'pages/encyclopedia.html', context)