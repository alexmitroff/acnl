from django.core.paginator import Paginator
from django.template.loader import render_to_string
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from rest_framework.views import APIView

from creatures.api.creature.pagination import CreatureThumbPagination
from creatures.api.creature.serializers import SerializerCreatureThumb
from creatures.models.creature import Creature
from creatures.models.section import Section


class APICreatureThumbListView(ListAPIView):
    queryset = Creature.objects.all()
    serializer_class = SerializerCreatureThumb
    pagination_class = CreatureThumbPagination


class APICreatureThumbPageView(APIView):

    def get(self, request):
        section_slug = request.GET['section']
        page = int(request.GET['page'])
        per_page = request.GET.get('per_page', 18)

        section = Section.objects.get(slug=section_slug)
        creatures = section.creature_set.all().select_related('rarity')

        creatures_paginator = Paginator(creatures, per_page)
        creatures_page = creatures_paginator.page(page)

        context = {
            'creatures': creatures_page
        }
        rendered_creatures = render_to_string('include/creature-thumb.html', context)

        context = {
            'section': {
                'slug': section_slug,
                'page_range': creatures_paginator.page_range,
                'current_page': page,
                'page_count': creatures_paginator.count,
            }
        }
        if creatures_page.has_next():
            context['section']['next_page'] = creatures_page.next_page_number()
        if creatures_page.has_previous():
            context['section']['prev_page'] = creatures_page.previous_page_number()
        rendered_pagination = render_to_string('include/pagination.html', context)

        data = {
            'block': f'id_{section_slug}',
            'creatures': rendered_creatures,
            'pagination': rendered_pagination,
        }
        return Response(data, status=200)
