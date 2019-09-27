from django.core.validators import validate_slug
from django.db import models

from creatures.models.creature import Creature


class BugType(models.Model):
    slug = models.SlugField('slug', unique=True, validators=[validate_slug])
    name = models.CharField('name', max_length=100)


class Bug(Creature):
    bug_type = models.ForeignKey(BugType, on_delete=models.CASCADE, blank=True, null=True)
