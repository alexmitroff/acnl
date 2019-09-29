from django.shortcuts import render

from encyclopedia.core.func import slice_creatures_from_section
from encyclopedia.views.encyclopediabase import EncyclopediaBase


class EncyclopediaView(EncyclopediaBase):

    def get(self, request):
        sections = []
        for section in self.get_shown_sections():
            creatures = section.creature_set.all().select_related('rarity')
            creatures_paginator = self.get_creature_paginator(creatures)
            page = 1
            creatures_page = creatures_paginator.page(page)
            section_data = {
                'name': section.name,
                'slug': section.slug,
                'creatures': creatures_page,
                'page_range': creatures_paginator.page_range,
                'current_page': page,
                'page_count': creatures_paginator.count
            }
            if creatures_page.has_next():
                section_data['next_page'] = creatures_page.next_page_number()
            if creatures_page.has_previous():
                section_data['prev_page'] = creatures_page.previous_page_number()

            sections.append(section_data)

        context = {
            'sections': sections,
            'mon': self.get_current_month(),
            # Additional #
            'page_title': 'Encyclopedia',
            'meta_description': ''
        }
        return render(request, 'pages/encyclopedia.html', context)
