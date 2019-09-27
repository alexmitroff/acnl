from django.contrib import admin
from creatures.models.rarity import Rarity


@admin.register(Rarity)
class RarityAdmin(admin.ModelAdmin):
    list_display = ('name',)