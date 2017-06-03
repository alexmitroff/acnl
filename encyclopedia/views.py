from django.shortcuts import render
from django.shortcuts import render_to_response
#~ from django.http import Http404
#~ from django.http import HttpResponseRedirect
#~ from django.core.context_processors import csrf
from django.template import RequestContext
from encyclopedia.models import Section, Unit, Month
import datetime

# Create your views here.

def get_month():
	d = datetime.datetime.now()
	m = d.strftime("%B")
	return m
	
def last_month(unit):
	now	= Month.objects.get(name=get_month())
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
	now	= Month.objects.get(name=get_month())
	neo_pos = now.pos-1
	if neo_pos < 1:
		neo_pos = 12
	neo = Month.objects.get(pos = neo_pos)
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

def index(request):
	template_url = 'pages/index.html'
	sections = Section.objects.filter(show = True).order_by('pos')
	month = get_month()
	var = {'sections': sections,
			'mon':month,}
	request_context = RequestContext(request)
	response = render_to_response(template_url, var, context_instance=request_context)
	return response

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
	var = { 'unit': unit,
	        'next': u_next,
	        'prev': u_prev,
			'months':months,
			'rarity_range':rarity_range,
			'mon':month,
			'last':last}
	request_context = RequestContext(request)
	response = render_to_response(template_url, var, context_instance=request_context)
	return response
	
def last(request):
	template_url = 'pages/last.html'
	sections = Section.objects.filter(show = True).order_by('pos')
	units = last_list(sections)
	bugs = units[0]
	fish = units[1]
	deep = units[2]
	month = get_month()
	var = { 'sections': sections,
			'bugs': bugs,
			'fish': fish,
			'deep': deep,
			'mon':month,}
	request_context = RequestContext(request)
	response = render_to_response(template_url, var, context_instance=request_context)
	return response
	
def monthly(request):
	template_url = 'pages/monthly.html'
	month = get_month()
	sections = Section.objects.filter(show = True).order_by('pos')
	units = new_list(sections)
	bugs = units[0]
	fish = units[1]
	deep = units[2]	
	month = get_month()
	var = { 'new_bugs': bugs[0],
			'old_bugs': bugs[1],
			'new_fish': fish[0],
			'old_fish': fish[1],
			'new_deep': deep[0],
			'old_deep': deep[1],
			'sections': sections,
			'mon':month,}
	request_context = RequestContext(request)
	response = render_to_response(template_url, var, context_instance=request_context)
	return response
			
