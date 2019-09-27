from django.core.management.base import BaseCommand

from encyclopedia.models import Season, Month


class Command(BaseCommand):

    def handle(self, *args, **options):
        seasons = (
            ('winter', 'Winter'),
            ('spring', 'Spring'),
            ('summer', 'Summer'),
            ('autumn', 'Autumn'),
        )

        for slug, name in seasons:
            season, created = Season.objects.get_or_create(slug=slug, defaults={
                'name': name,
            })
            if created:
                print(f'Rarity level "{season.name}" created')
            else:
                print(f'Rarity level "{season.name}" exists')

            Month.objects.filter(season_old=slug).update(season=season)
