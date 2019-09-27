from django.core.management.base import BaseCommand

from creatures.models.section import Section as NewSection
from encyclopedia.models import Section


class Command(BaseCommand):

    def handle(self, *args, **options):

        sections = Section.objects.filter(show=True)
        for section in sections:
            slug = '-'.join(section.name.lower().split(' '))
            defaults = {
                'name': section.name,
                'pos': section.pos,
                'show': section.show,
                'desc': section.desc,
            }
            new_section, created = NewSection.objects.get_or_create(slug=slug, defaults=defaults)

            if created:
                print(f'Section "{new_section.name}" created')
            else:
                print(f'Section "{new_section.name}" exists')