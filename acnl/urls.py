from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path, include

from acnl.sitemap import EncSitemap
from acnl.sitemap import UnitSitemap
from acnl.sitemap import ViewSitemap

sitemaps = {'views': ViewSitemap,
            'encyclopedia':EncSitemap,
            'units': UnitSitemap,}

urlpatterns = [
    path('nook/', admin.site.urls),
    path('', include('encyclopedia.urls'))
    #path('sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
]

urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
