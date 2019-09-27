from django.contrib import admin
from creatures.models.shadow import Shadow


@admin.register(Shadow)
class ShadowAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug', 'size')
