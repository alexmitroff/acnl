from django.db import models


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

    @property
    def next_month(self):
        pos = self.pos + 1
        if pos > 12:
            return 1
        return Month.objects.get(pos=pos)

    @property
    def prev_month(self):
        pos = self.pos - 1
        if pos < 1:
            return 12
        return Month.objects.get(pos=pos)

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
    
    section = models.ForeignKey(Section)
    pos = models.IntegerField('position', default=0)
    pic = models.ImageField('image', upload_to='units',)
    name = models.CharField('name', max_length=100)
    rarity = models.IntegerField('rarity', choices=RARITY_CHOICES,default=1)
    desc = models.TextField('description')
    loc = models.CharField('location', max_length=100, blank=True)
    island = models.BooleanField('island', default=False)
    shadow = models.CharField('shadow', choices=SHADOW_CHOICES, max_length=7, blank=True)
    price = models.IntegerField('price', default=100)
    months = models.ManyToManyField(Month)
    str_time = models.TimeField('start time')
    end_time = models.TimeField('end time')

    def __str__(self):
        return self.name

