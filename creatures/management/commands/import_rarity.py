from django.core.management.base import BaseCommand

from creatures.models.rarity import Rarity


class Command(BaseCommand):

    def handle(self, *args, **options):
        rarity = (
            (1, 'Very Common'),
            (2, 'Common'),
            (3, 'Rare'),
            (4, 'Vary Rare'),
        )

        for level, name in rarity:
            slug = '-'.join(name.lower().split(' '))
            rarity_obj, created = Rarity.objects.get_or_create(slug=slug, defaults={
                'name': name,
                'level': level,
                'color': '0,50%,50'
            })
            if created:
                print(f'Rarity level "{rarity_obj.name}" created')
            else:
                print(f'Rarity level "{rarity_obj.name}" exists')
