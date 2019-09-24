from django.shortcuts import render

from encyclopedia.views.encyclopedia import EncyclopediaView


class IndexView(EncyclopediaView):

    def get(self, request):
        context = {
            'sections': self.get_shown_sections(),
            'mon': self.get_current_month(),
        }
        return render(request, 'pages/index.html', context)
