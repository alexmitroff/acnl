from django.urls import path
from creatures.views.creature import CreatureView

app_name = 'creatures'

urlpatterns = [
    path('creatures/<slug:section_slug>/<slug:creature_slug>/', CreatureView.as_view(), name='creature'),
]