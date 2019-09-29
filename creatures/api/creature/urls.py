from django.urls import path
from creatures.api.creature.views import APICreatureThumbListView, APICreatureThumbPageView
app_name = "creature"

urlpatterns = [
    path('api/creatures/creature/thumb/list/', APICreatureThumbListView.as_view(), name='thumbs'),
    path('api/creatures/creature/thumb/page/', APICreatureThumbPageView.as_view(), name='thumb-page')
]