from django.http import Http404
from django.views.generic import TemplateView
from django.utils import timezone
from django.db.models import Exists, OuterRef

from creatures.models.animal import Animal
from encyclopedia.core.month import month
from encyclopedia.models import Month
from encyclopedia.views.encyclopediabase import EncyclopediaBase


class CreatureView(TemplateView):
    template_name = 'pages/creature.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        creature = Animal.objects.filter(slug=self.kwargs['creature_slug']).first()
        if creature is None:
            raise Http404

        months = Month.objects.all().annotate(
            is_active=Exists(creature.months.filter(pk=OuterRef('pk')))
            ).select_related('season').order_by('pos')

        context.update({
            'mon': month.get_name(timezone.now()),
            'months': months,
            'creature': creature,
            'next': creature.next,
            'prev': creature.prev,
            # Additional
            'page_title': creature.name,
        })
        return context

    # def get(self, request, section_slug, creature_slug):
    #     creature = get_object_or_404(Creature, slug=creature_slug)
    #     next_creature = Creature.objects.filter(section__slug=section_slug,
    #                                             position__gt=creature.position).order_by('position').first()
    #     prev_creature = Creature.objects.filter(section__slug=section_slug,
    #                                             position__lt=creature.position).order_by('position').last()
    #     months = Month.objects.all().select_related('season').order_by('pos')
    #     months = self.mark_active_month(months, creature)
    #     context = {
    #         'mon': self.get_current_month(),
    #         'months': months,
    #         'rarity_range': range(0, creature.rarity.level),
    #         'creature': creature,
    #         'next': next_creature,
    #         'prev': prev_creature,
    #         'last': self.is_last_month(creature),
    #         # Additional
    #         'page_title': creature.name,
    #     }
    #     return render(request, 'pages/creature.html', context)