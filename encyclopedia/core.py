from encyclopedia.models import Month, Unit
import datetime


def get_month():
    d = datetime.datetime.now()
    m = d.strftime("%B")
    return m


def last_month(unit):
    now = Month.objects.get(name=get_month())
    position = now.pos+1
    if position > 12:
        position = 1
    neo = Month.objects.get(pos = position)
    months = unit.months.all().order_by('pos')
    if now in months:
        if neo not in months:
            return 2
        else:
            return 1
    else:
        return 0


def first_month(unit):
    now = Month.objects.get(name=get_month())
    neo_pos = now.pos-1
    if neo_pos < 1:
        neo_pos = 12
    neo = Month.objects.get(pos=neo_pos)
    months = unit.months.all().order_by('pos')
    if now in months:
        if neo not in months:
            return 2
        else:
            return 1
    else:
        return 0


def last_list(sections):
    l_list = []
    month = get_month()
    units = Unit.objects.filter(months__name=month).order_by('pos')
    for section in sections:
        u_list = []
        for unit in units:
            if unit.section == section:
                l = last_month(unit)
                if l == 2:
                    u_list.append(unit)
        l_list.append(u_list)
    return l_list


def new_list(sections):
    l_list = []
    month = get_month()
    units = Unit.objects.filter(months__name=month).order_by('pos')
    for section in sections:
        u_list = []
        n_list = [] #new units in this month
        o_list = [] #old units
        for unit in units:
            if unit.section == section:
                l = first_month(unit)
                if l == 2:
                    n_list.append(unit)
                elif l == 1:
                    o_list.append(unit)
        u_list.append(n_list)
        u_list.append(o_list)
        l_list.append(u_list)
    return l_list
