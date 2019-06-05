from django.conf import settings
from django.conf.urls import include
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.contrib.sitemaps.views import sitemap
from django.http import Http404
from .sitemap import ViewSitemap
from .sitemap import UnitSitemap
from .sitemap import EncSitemap

from encyclopedia.views import *

sitemaps = {'views': ViewSitemap,
            'encyclopedia': EncSitemap,
            'units': UnitSitemap,
            }

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', last, name='last'),
    url(r'^encyclopedia/$', index, name='index'),
    url(r'^available/$', monthly, name='monthly'),
    url(r'^encyclopedia/(?P<unit_id>\d+)/$', unit, name='unit'),
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
]

urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
