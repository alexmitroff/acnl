def unit(request, unit_id):
    template_url = 'pages/unit.html'
    unit = Unit.objects.get(pk=int(unit_id))
    sect = unit.section
    try:
        u_next = Unit.objects.filter(section=sect).filter(id__gt=unit.id).order_by('id')[:1].get()
    except:
        u_next = None
    try:
        u_prev = Unit.objects.filter(section=sect).filter(id__lt=unit.id).order_by('-id')[:1].get()
    except:
        u_prev = None
    months = Month.objects.all()
    rarity_range = range(0, unit.rarity)
    last = last_month(unit)
    month = get_month()
    var = {'unit': unit,
           'next': u_next,
           'prev': u_prev,
           'months': months,
           'rarity_range': rarity_range,
           'mon': month,
           'last': last}
    request_context = RequestContext(request)
    return render(request, template_url, var)