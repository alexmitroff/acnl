from django.db import models

from creatures.models.creature import Creature


class DeepSea(Creature):
    shadow = models.ForeignKey('creatures.Shadow', on_delete=models.CASCADE)