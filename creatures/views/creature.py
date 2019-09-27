from django.shortcuts import render, get_object_or_404

from creatures.models.creature import Creature
from encyclopedia.models import Month
from encyclopedia.views.encyclopediabase import EncyclopediaBase


class CreatureView(EncyclopediaBase):

    def get(self, request, section_slug, creature_slug):
        creature = get_object_or_404(Creature, slug=creature_slug)
        next_creature = Creature.objects.filter(section__slug=section_slug,
                                                position__gt=creature.position).order_by('position').first()
        prev_creature = Creature.objects.filter(section__slug=section_slug,
                                                position__lt=creature.position).order_by('position').last()
        months = Month.objects.all()
        months = self.mark_active_month(months, creature)
        context = {
            'mon': self.get_current_month(),
            'months': months,
            'rarity_range': range(0, creature.rarity.level),
            'unit': creature,
            'next': next_creature,
            'prev': prev_creature,
            'last': self.is_last_month(creature),
            # Additional
            'page_title': creature.name,
        }
        return render(request, 'pages/creature.html', context)