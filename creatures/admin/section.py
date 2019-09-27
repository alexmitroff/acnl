from django.contrib import admin
from creatures.models.section import Section


@admin.register(Section)
class SectionAdmin(admin.ModelAdmin):
    list_display = ('name',)