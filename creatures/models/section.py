from django.db import models
from django.core.validators import validate_slug


class Section(models.Model):
    pos = models.IntegerField('position', default=0)
    show = models.BooleanField('show', default=False, db_index=True)
    slug = models.SlugField('slug', unique=True, db_index=True)
    name = models.CharField('name', max_length=100)
    desc = models.TextField('description')

    def __str__(self):
        return self.name