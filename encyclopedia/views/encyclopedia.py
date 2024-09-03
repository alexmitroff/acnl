
from django.core.paginator import Paginator
from django.utils import timezone
from django.views.generic import TemplateView

from creatures.models.section import Section
from encyclopedia.core.month import month


DEFAULT_SLICE = 18


class EncyclopediaView(TemplateView):
    template_name = 'pages/encyclopedia.html'

    def get_context_data(self, **kwargs):
        sections = Section.objects.all().order_by('pos')
        for section in sections:
            creatures = section.animal_set.all().order_by('position')
            paginator = Paginator(creatures, per_page=DEFAULT_SLICE)
            section.creatures = paginator.page(1)

        context =  super().get_context_data(**kwargs)
        context.update({
            'sections': sections,
            'mon': month.get_name(timezone.now()),
            # Additional #
            'page_title': 'Encyclopedia',
            'meta_description': ''
        })
        return context


class EncyclopediaPageView(TemplateView):
    template_name = 'include/creature-pagination.html'

    def get_context_data(self, **kwargs):
        section = Section.objects.get(pk=self.kwargs['pk'])
        creatures = section.animal_set.all().order_by('position')
        paginator = Paginator(creatures, per_page=DEFAULT_SLICE)

        context =  super().get_context_data(**kwargs)
        context.update({
            'section_pk': section.pk,
            'section_slug': section.slug,
            'creatures': paginator.page(self.kwargs['page']),
        })
        return context
