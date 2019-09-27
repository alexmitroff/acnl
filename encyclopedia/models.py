from django.core.validators import validate_slug
from django.db import models

from acnl.core.validators import validate_hsl_color


class Season(models.Model):
    name = models.CharField('name', max_length=10)
    slug = models.SlugField('slug', unique=True, validators=[validate_slug])
    color = models.CharField('name', max_length=100, validators=[validate_hsl_color],
                             blank=True, null=True, help_text='Example: 120,50%,50%')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'season'
        verbose_name_plural = 'seasons'


class Month(models.Model):
    SEASON_CHOICES = (
        ('winter', 'Winter'),
        ('spring', 'Spring'),
        ('summer', 'Summer'),
        ('autumn', 'Autumn'),
    )
    pos = models.IntegerField('position', default=0)
    name = models.CharField('name', max_length=10)
    season = models.ForeignKey(Season, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'month'
        verbose_name_plural = 'months'
