from django.http import Http404
from django.views.generic import TemplateView
from django.utils import timezone
from django.db.models import Exists, OuterRef

from creatures.models.animal import Animal
from encyclopedia.core.month import month
from encyclopedia.models import Month


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
            'mon_num': month.current,
            'months': months,
            'creature': creature,
            'next': creature.next,
            'prev': creature.prev,
            # Additional
            'page_title': creature.name,
        })
        return context
