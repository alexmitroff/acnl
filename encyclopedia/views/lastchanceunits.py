from django.utils import timezone
from django.views.generic import TemplateView

from creatures.models.section import Section
from encyclopedia.core.month import month


class LastChanceUnitsView(TemplateView):
    template_name = 'pages/creatures.html'

    def get_context_data(self, **kwargs):
        sections = Section.objects.all().order_by('pos')
        for section in sections:
            section.creatures = section.animal_set.filter(
                will_be_in_next_month__lt=1,
                is_available_this_month__gt=0,
            ).order_by('was_in_previous_month', 'position')

        mon = month.get_name(timezone.now())
        context =  super().get_context_data(**kwargs)
        context.update({
            'mon': mon,
            'page_title': f'{mon} last chance',
            'sections': sections,
        })
        return context
