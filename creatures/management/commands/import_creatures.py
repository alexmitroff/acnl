from django.core.management.base import BaseCommand

from creatures.models.bug import Bug
from creatures.models.deepsea import DeepSea
from creatures.models.fish import Fish
from creatures.models.rarity import Rarity
from creatures.models.section import Section as NewSection
from creatures.models.shadow import Shadow
from encyclopedia.models import Section


class Command(BaseCommand):

    def handle(self, *args, **options):

        model_dict = {
            'bugs': Bug,
            'fish': Fish,
            'deep-sea-creatures': DeepSea
        }

        sections = Section.objects.filter(show=True)
        for section in sections:
            section_slug = '-'.join(section.name.lower().split(' '))
            new_section = NewSection.objects.get(slug=section_slug)

            units = section.unit_set.all().order_by('pos').prefetch_related('months')
            for unit in units:
                unit_slug = '-'.join(unit.name.lower().split(' '))
                defaults = {
                    'section': new_section,

                    'name': unit.name,
                    'description': section.desc,
                    'position': unit.pos,

                    'picture': unit.pic,
                    'rarity': Rarity.objects.get(level=unit.rarity),
                    'price': unit.price,

                    'inhabit': unit.loc,
                    'is_island': unit.island,

                    'time_appearance': unit.str_time,
                    'time_disappearance': unit.end_time
                }

                if unit.shadow:
                    defaults['shadow'] = Shadow.objects.get(slug=unit.shadow.lower())

                if not model_dict[section_slug].objects.filter(slug=unit_slug).exists():
                    new_unit = model_dict[section_slug].objects.create(slug=unit_slug, **defaults)
                    new_unit.months.add(*unit.months.all().values_list('id', flat=True))
                    print(f'Creature "{new_unit.name}" created')
                else:
                    print(f'Creature "{new_unit.name}" exists')


