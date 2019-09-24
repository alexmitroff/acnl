from django.shortcuts import render

from encyclopedia.views.encyclopedia import EncyclopediaView


class LastView(EncyclopediaView):

    def get(self, request):
        sections = self.get_shown_sections()
        units = self.last_month_unit_list(sections)
        context = {
            'sections': sections,
            'mon': self.get_current_month(),
            'bugs': units[0],
            'fish': units[1],
            'deep': units[2],
        }
        return render(request, 'pages/last.html', context)
