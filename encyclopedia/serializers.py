from .models import *
from rest_framework import serializers


class UnitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Unit
        fields = (  'section','pos','pic','name','rarity', 'desc','loc',
                'island','shadow','price','months','str_time','end_time')
