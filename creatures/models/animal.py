from django.db import models


class Animal(models.Model):
    class Meta:
        verbose_name = 'animal'
        verbose_name_plural = 'animals'

    section = models.ForeignKey('creatures.Section', on_delete=models.CASCADE)
    months = models.ManyToManyField('encyclopedia.Month')

    name = models.CharField('name', max_length=100)
    description = models.TextField('description')
    slug = models.SlugField('slug', unique=True)
    position = models.IntegerField('position', default=0)

    picture = models.ImageField('image', upload_to='animals')
    rarity = models.ForeignKey('creatures.Rarity', on_delete=models.CASCADE)
    price = models.IntegerField('price', default=100)

    inhabit = models.CharField('location', max_length=100, blank=True)
    is_island = models.BooleanField('Available on island', default=False)

    time_appearance = models.TimeField('appearance time')
    time_disappearance = models.TimeField('disappearance time')

    # Bug specific
    bug_type = models.ForeignKey('creatures.Bug', on_delete=models.CASCADE, blank=True, null=True)

    # Fish and deepsea specific
    shadow = models.ForeignKey('creatures.Shadow', on_delete=models.CASCADE, blank=True, null=True)
