from django.core.validators import validate_slug
from django.db import models
from polymorphic.models import PolymorphicModel
from django.urls import reverse


class Creature(PolymorphicModel):

    section = models.ForeignKey('creatures.Section', on_delete=models.CASCADE)
    months = models.ManyToManyField('encyclopedia.Month')

    name = models.CharField('name', max_length=100)
    description = models.TextField('description')
    slug = models.SlugField('slug', unique=True, validators=[validate_slug])
    position = models.IntegerField('position', default=0)

    picture = models.ImageField('image', upload_to='units', )
    rarity = models.ForeignKey('creatures.Rarity', on_delete=models.CASCADE)
    price = models.IntegerField('price', default=100)

    inhabit = models.CharField('location', max_length=100, blank=True)
    is_island = models.BooleanField('Available on island', default=False)

    time_appearance = models.TimeField('appearance time')
    time_disappearance = models.TimeField('disappearance time')

    @property
    def picture_url(self):
        if self.picture:
            return self.picture.url
        return None

    @property
    def tortimer_island_status(self):
        status = 'Available' if self.is_island else 'Unavailable'
        return f"{status} on Tortimer's island"

    @property
    def location(self):
        return f"{self.inhabit}. {self.tortimer_island_status}"

    @property
    def time(self):
        start_time = self.time_appearance.strftime('%I:%M')
        end_time = self.time_disappearance.strftime('%I:%M')
        if start_time == '00:00' and end_time == '00:00':
            return 'All day'
        start_time = self.time_appearance.strftime('%I:%M %p')
        end_time = self.time_disappearance.strftime('%I:%M %p')
        return f'From {start_time} till {end_time}'

    @property
    def url(self):
        return reverse('creatures:creature', kwargs={'section_slug': self.section.slug, 'creature_slug': self.slug})