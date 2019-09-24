







def last(request):
    template_url = 'pages/last.html'
    sections = Section.objects.filter(show=True).order_by('pos')
    units = last_list(sections)
    bugs = units[0]
    fish = units[1]
    deep = units[2]
    month = get_month()
    var = {'sections': sections,
           'bugs': bugs,
           'fish': fish,
           'deep': deep,
           'mon': month, }
    request_context = RequestContext(request)
    return render(request, template_url, var)