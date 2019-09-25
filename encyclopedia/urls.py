from django.urls import path

from encyclopedia.views.index import IndexView, NewIndexView
from encyclopedia.views.last import LastView
from encyclopedia.views.monthly import MonthlyView
from encyclopedia.views.unit import UnitView

urlpatterns = [
    path('', LastView.as_view(), name='last'),
    path('available/', MonthlyView.as_view(), name='monthly'),
    path('encyclopedia/', NewIndexView.as_view(), name='index'),
    path('encyclopedia/old/', IndexView.as_view(), name='index'),
    path('encyclopedia/<int:pk>/', UnitView.as_view(), name='unit'),
]