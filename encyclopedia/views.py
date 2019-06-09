from django.shortcuts import render

from encyclopedia.naturalist import Naturalist
from encyclopedia.models import *
from encyclopedia.core import *


def index(request):
    template_url = 'pages/index.html'
    month = get_month()
    naturalist = Naturalist(month)
    naturalist.remember_creature_classification()
    context = {
        'creatures': naturalist.all_creatures,
        'mon': month
    }
    return render(request, template_url, context)


def unit(request, unit_id):
    template_url = 'pages/unit.html'
    unit = Unit.objects.get(pk=int(unit_id))
    sect = unit.section
    try:
        u_next = Unit.objects.filter(section = sect).filter(id__gt=unit.id).order_by('id')[:1].get()
    except:
        u_next = None
    try:
        u_prev = Unit.objects.filter(section = sect).filter(id__lt=unit.id).order_by('-id')[:1].get()
    except:
        u_prev = None
    months = Month.objects.all()
    rarity_range = range(0, unit.rarity)
    last = last_month(unit)
    month = get_month()
    context = { 'unit': unit,
            'next': u_next,
            'prev': u_prev,
            'months':months,
            'rarity_range':rarity_range,
            'mon':month,
            'last':last}
    return render(request, template_url, context)


def last(request):
    template_url = 'pages/last.html'
    sections = Section.objects.filter(show = True).order_by('pos')
    units = last_list(sections)
    bugs = units[0]
    fish = units[1]
    deep = units[2]
    month = get_month()
    context = {
        'sections': sections,
        'bugs': bugs,
        'fish': fish,
        'deep': deep,
        'mon': month
    }
    return render(request, template_url, context)


def monthly(request):
    template_url = 'pages/monthly.html'
    sections = Section.objects.filter(show=True).order_by('pos')
    units = new_list(sections)
    bugs = units[0]
    fish = units[1]
    deep = units[2]
    month = get_month()
    context = {
        'new_bugs': bugs[0],
        'old_bugs': bugs[1],
        'new_fish': fish[0],
        'old_fish': fish[1],
        'new_deep': deep[0],
        'old_deep': deep[1],
        'sections': sections,
        'mon': month
    }
    return render(request, template_url, context)
