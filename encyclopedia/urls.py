from django.urls import path

from encyclopedia.views.index import IndexView

urlpatterns = [
    #path(r'', last, name='last'),
    path('encyclopedia/', IndexView.as_view(), name='index'),
    #path(r'^available/$', monthly, name='monthly'),
    #path(r'^encyclopedia/(?P<unit_id>\d+)/$', unit, name='unit'),
]