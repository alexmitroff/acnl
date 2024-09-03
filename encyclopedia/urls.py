from django.urls import path

from encyclopedia.views.availableunits import AvailableUnitsView
from encyclopedia.views.encyclopedia import EncyclopediaPageView, EncyclopediaView
from encyclopedia.views.lastchanceunits import LastChanceUnitsView

app_name = 'encyclopedia'

urlpatterns = [
    path('', LastChanceUnitsView.as_view(), name='last-chance-units'),
    path('available/', AvailableUnitsView.as_view(), name='available-units'),
    path('encyclopedia/', EncyclopediaView.as_view(), name='encyclopedia'),

    path('api/encyclopedia/<int:pk>/<int:page>/', EncyclopediaPageView.as_view(), name='page'),
]
