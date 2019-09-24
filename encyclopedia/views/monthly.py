from django.shortcuts import render

from encyclopedia.views.encyclopedia import EncyclopediaView


class MonthlyView(EncyclopediaView):

    def get(self, request):
        sections = self.get_shown_sections()
        units = self.new_unit_list(sections)
        bugs = units[0]
        fish = units[1]
        deep = units[2]
        context = {
            'sections': sections,
            'mon': self.get_current_month(),
            'new_bugs': bugs[0],
            'old_bugs': bugs[1],
            'new_fish': fish[0],
            'old_fish': fish[1],
            'new_deep': deep[0],
            'old_deep': deep[1],
        }
        return render(request, 'pages/monthly.html', context)
