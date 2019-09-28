from rest_framework.generics import ListAPIView

from creatures.api.creature.pagination import CreatureThumbPagination
from creatures.api.creature.serializers import SerializerCreatureThumb
from creatures.models.creature import Creature


class APICreatureThumbListView(ListAPIView):
    queryset = Creature.objects.all()
    serializer_class = SerializerCreatureThumb
    pagination_class = CreatureThumbPagination
