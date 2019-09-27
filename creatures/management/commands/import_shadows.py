from django.core.management.base import BaseCommand

from creatures.models.shadow import Shadow


class Command(BaseCommand):

    def handle(self, *args, **options):
        shadows = (
            (0, 'Narrow'),
            (1, '1'),
            (2, '2'),
            (3, '3'),
            (4, '4'),
            (5, '5'),
            (6, '6'),
            (7, 'Fin'),
        )

        for size, name in shadows:
            slug = '-'.join(name.lower().split(' '))
            shadow, created = Shadow.objects.get_or_create(slug=slug, defaults={
                'name': name,
                'size': size
            })
            if created:
                print(f'Rarity level "{shadow.name}" created')
            else:
                print(f'Rarity level "{shadow.name}" exists')