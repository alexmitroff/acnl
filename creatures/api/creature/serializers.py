from rest_framework import serializers
from creatures.models.creature import Creature
from creatures.models.bug import Bug


class SerializerCreatureThumb(serializers.ModelSerializer):
    picture_url = serializers.ReadOnlyField()
    url = serializers.ReadOnlyField()

    class Meta:
        model = Creature
        fields = (
            'name',
            'picture_url',
            'url',
            'rarity',
        )