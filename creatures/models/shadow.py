from django.core.validators import validate_slug
from django.db import models


class Shadow(models.Model):
    size = models.PositiveIntegerField(default=1)
    slug = models.SlugField('slug', unique=True, validators=[validate_slug])
    name = models.CharField('name', max_length=100)
    picture = models.ImageField('picture', upload_to='shadows', blank=True, null=True)

    @property
    def picture_url(self):
        if self.picture:
            return self.picture.url
        return None

    def __str__(self):
        return self.name