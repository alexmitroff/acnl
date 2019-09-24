
def monthly(request):
    template_url = 'pages/monthly.html'
    month = get_month()
    sections = Section.objects.filter(show=True).order_by('pos')
    units = new_list(sections)
    bugs = units[0]
    fish = units[1]
    deep = units[2]
    month = get_month()
    var = {'new_bugs': bugs[0],
           'old_bugs': bugs[1],
           'new_fish': fish[0],
           'old_fish': fish[1],
           'new_deep': deep[0],
           'old_deep': deep[1],
           'sections': sections,
           'mon': month, }
    request_context = RequestContext(request)
    return render(request, template_url, var)