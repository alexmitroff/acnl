from django.urls import path

from encyclopedia.views.index import IndexView, NewIndexView
from encyclopedia.views.last import LastView
from encyclopedia.views.monthly import MonthlyView
from encyclopedia.views.unit import UnitView
from encyclopedia.views.availableunits import AvailableUnitsView
from encyclopedia.views.lastchanceunits import LastChanceUnitsView

urlpatterns = [
    path('', LastChanceUnitsView.as_view(), name='last-chance-units'),
    path('available/', AvailableUnitsView.as_view(), name='available-units'),
    path('encyclopedia/', NewIndexView.as_view(), name='encyclopedia'),
    path('old/', LastView.as_view(), name='last'),
    path('old/available/', MonthlyView.as_view(), name='monthly'),
    path('old/encyclopedia/', IndexView.as_view(), name='index'),
    path('encyclopedia/<int:pk>/', UnitView.as_view(), name='unit'),
]
