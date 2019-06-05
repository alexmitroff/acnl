from django.core.urlresolvers import reverse
from django.contrib.sitemaps import Sitemap
from encyclopedia.models import Unit
from datetime import datetime as dt


class ViewSitemap(Sitemap):
    changefreq = 'monthly'
    priority = 0.8
    i18n = True

    def items(self):
        #static pages
        return ['last', 'monthly']

    def location(self, item):
        return reverse(item)


class EncSitemap(Sitemap):
    changefreq = 'yearly'
    priority = 0.5
    i18n = True

    def items(self):
        #static pages
        return ['index']

    def location(self, item):
        return reverse(item)


class UnitSitemap(Sitemap):
    changefreq = 'yearly'
    priority = 0.5
    i18n = False

    def items(self):
        return Unit.objects.all().order_by('pos')

    def lastmod(self, obj):
        return dt.now()

    def location(self, obj):
        return "/encyclopedia/%s/" % obj.id
