from django.core.validators import validate_slug
from django.db import models

from acnl.core.validators import validate_hsl_color


class Rarity(models.Model):
    level = models.PositiveIntegerField('level')
    name = models.CharField('name', max_length=100)
    slug = models.SlugField('slug', unique=True, validators=[validate_slug])
    color = models.CharField('name', max_length=100, validators=[validate_hsl_color],
                             blank=True, null=True, help_text='Example: 120,50%,50%')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'rarity level'
        verbose_name_plural = 'rarity levels'
        db_table = 'creatures.rarity'
