from django.urls import path
from creatures.api.creature.views import APICreatureThumbListView
app_name = "creature"

urlpatterns = [
    path('api/creatures/creature/thumb/list/', APICreatureThumbListView.as_view(), name='thumbs')
]