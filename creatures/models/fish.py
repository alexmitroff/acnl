from django.db import models

from creatures.models.creature import Creature


class Fish(Creature):
    shadow = models.ForeignKey('creatures.Shadow', on_delete=models.CASCADE)
