from django.shortcuts import render

from encyclopedia.views.encyclopedia import EncyclopediaView


class AvailableUnitsView(EncyclopediaView):

    def get(self, request):
        sections = self.get_shown_sections()
        sections = self.get_active_units_list_by_section(sections)
        context = {
            'sections': sections,
            'mon': self.get_current_month(),
        }
        return render(request, 'pages/avaliable.html', context)