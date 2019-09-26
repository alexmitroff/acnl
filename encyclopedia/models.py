from django.db import models
from django.urls import reverse


class Section(models.Model):
    pos = models.IntegerField('position', default=0)
    show = models.BooleanField('show', default=False)
    name = models.CharField('name', max_length=100)
    desc = models.TextField('description')

    def __str__(self):
        return self.name


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


class Unit(models.Model):
    SHADOW_CHOICES = (
        ('1', '1'),
        ('2', '2'),
        ('3', '3'),
        ('4', '4'),
        ('5', '5'),
        ('6', '6'),
        ('fin', 'Fin'),
        ('narrow', 'Narrow'),
    )

    RARITY_CHOICES = (
        (1, 'Very Common'),
        (2, 'Common'),
        (3, 'Rare'),
        (4, 'Vary Rare'),
    )

    section = models.ForeignKey(Section, on_delete=models.CASCADE)
    pos = models.IntegerField('position', default=0)
    pic = models.ImageField('image', upload_to='units', )
    name = models.CharField('name', max_length=100)
    rarity = models.IntegerField('rarity', choices=RARITY_CHOICES, default=1)
    desc = models.TextField('description')
    loc = models.CharField('location', max_length=100, blank=True)
    island = models.BooleanField('island', default=False)
    shadow = models.CharField('shadow', choices=SHADOW_CHOICES, max_length=7, blank=True)
    price = models.IntegerField('price', default=100)
    months = models.ManyToManyField(Month)
    str_time = models.TimeField('start time')
    end_time = models.TimeField('end time')

    @property
    def picture(self):
        if self.pic:
            return self.pic.url
        return None

    @property
    def tortimer_island_status(self):
        status = 'Available' if self.island else 'Unavailable'
        return f"{status} on Tortimer's island"

    @property
    def location(self):
        return f"{self.loc}. {self.tortimer_island_status}"

    @property
    def time(self):
        start_time = self.str_time.strftime('%I:%M')
        end_time = self.end_time.strftime('%I:%M')
        if start_time == '00:00' and end_time == '00:00':
            return 'All day'
        start_time = self.str_time.strftime('%I:%M %p')
        end_time = self.end_time.strftime('%I:%M %p')
        return f'From {start_time} till {end_time}'

    @property
    def url(self):
        return reverse('encyclopedia:unit', kwargs={'pk': self.id})

    def __str__(self):
        return self.name
