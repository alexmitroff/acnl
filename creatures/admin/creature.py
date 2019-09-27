from django.contrib import admin
from polymorphic.admin import PolymorphicParentModelAdmin, PolymorphicChildModelAdmin, PolymorphicChildModelFilter

from creatures.models.bug import Bug
from creatures.models.creature import Creature
from creatures.models.deepsea import DeepSea
from creatures.models.fish import Fish


class CreatureInstanceAdmin(PolymorphicChildModelAdmin):
    base_model = Creature
    list_display = ('name', 'section')
    show_in_index = True


@admin.register(Fish)
class FishAdmin(CreatureInstanceAdmin):
    base_model = Fish


@admin.register(Bug)
class BugAdmin(CreatureInstanceAdmin):
    base_model = Bug


@admin.register(DeepSea)
class DeepSeaAdmin(CreatureInstanceAdmin):
    base_model = DeepSea


class CreatureAdmin(PolymorphicParentModelAdmin):
    base_model = Creature
    child_models = (Bug, DeepSea, Fish)
    list_filter = (PolymorphicChildModelFilter,)