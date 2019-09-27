from django.db import models


class Month(models.Model):
    SEASON_CHOICES = (
        ('winter', 'Winter'),
        ('spring', 'Spring'),
        ('summer', 'Summer'),
        ('autumn', 'Autumn'),
    )
    pos = models.IntegerField('position', default=0)
    name = models.CharField('name', max_length=10)
    season = models.CharField('season', choices=SEASON_CHOICES, max_length=7, default='winter')

    def __str__(self):
        return self.name
