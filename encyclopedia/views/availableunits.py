from django.utils import timezone
from django.views.generic import TemplateView

from creatures.models.section import Section
from encyclopedia.core.month import month


class AvailableUnitsView(TemplateView):
    template_name = 'pages/creatures.html'

    def get_context_data(self, **kwargs):
        sections = Section.objects.all().order_by('pos')
        for section in sections:
            section.creatures = section.animal_set.filter(
                is_available_this_month__gt=0,
            ).order_by('was_in_previous_month', 'position')

        mon = month.get_name(timezone.now())
        context =  super().get_context_data(**kwargs)
        context.update({
            'sections': sections,
            'mon': mon,
            # Additional #
            'page_title': f'Available in {mon}',
            'meta_description': ''
        })
        return context
