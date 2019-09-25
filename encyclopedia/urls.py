from django.urls import path

from encyclopedia.views.availableunits import AvailableUnitsView
from encyclopedia.views.encyclopedia import EncyclopediaView
from encyclopedia.views.lastchanceunits import LastChanceUnitsView
from encyclopedia.views.monthly import MonthlyView
from encyclopedia.views.unit import UnitView

urlpatterns = [
    path('', LastChanceUnitsView.as_view(), name='last-chance-units'),
    path('available/', AvailableUnitsView.as_view(), name='available-units'),
    path('encyclopedia/', EncyclopediaView.as_view(), name='encyclopedia'),
    path('old/available/', MonthlyView.as_view(), name='monthly'),
    path('encyclopedia/<int:pk>/', UnitView.as_view(), name='unit'),
]
