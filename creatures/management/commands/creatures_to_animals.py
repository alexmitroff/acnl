from django.core.management.base import BaseCommand

from creatures.models import Animal, Bug, DeepSea, Fish


class Command(BaseCommand):

    def process_creatures(self, creatures):
        for creature in creatures:
            creature.pop('id')
            creature.pop('polymorphic_ctype_id')
            creature.pop('creature_ptr_id')

            slug = creature.pop('slug')

            animal, created = Animal.objects.get_or_create(slug=slug, defaults=creature)

            if created:
                print(f'{animal.name} was added to Animal model')
            else:
                print(f'{animal.name} is already exist in Animal model')

    def process_months(self, creatures):
        for creature in creatures:
            animal = Animal.objects.get(slug=creature.slug)
            months = creature.months.all().order_by('pos')
            for month in months:
                animal.months.add(month)
                print(f'{month.name} was added to {animal.name} in Animal model')


    def handle(self, *args, **options):

        bug = Bug.objects.all().order_by('position').values()
        deepsea = DeepSea.objects.all().order_by('position').values()
        fish = Fish.objects.all().order_by('position').values()

        creature_sets = (bug, deepsea, fish)

        for creature_set in creature_sets:
            self.process_creatures(creature_set)

        bug = Bug.objects.all().order_by('position')
        deepsea = DeepSea.objects.all().order_by('position')
        fish = Fish.objects.all().order_by('position')

        creature_sets = (bug, deepsea, fish)
        for creature_set in creature_sets:
            self.process_months(creature_set)
