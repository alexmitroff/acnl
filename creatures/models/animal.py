from django.db import models
from django.urls import reverse

from encyclopedia.core.month import month


class MonthsAnnotationManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().annotate(
                is_available_this_month=models.Count('id', filter=models.Q(months__pos=month.current)),
                will_be_in_next_month=models.Count('id', filter=models.Q(months__pos=month.next)),
                was_in_previous_month=models.Count('id', filter=models.Q(months__pos=month.previous)),
            ).select_related('rarity')


class Animal(models.Model):
    class Meta:
        verbose_name = 'animal'
        verbose_name_plural = 'animals'

    objects = MonthsAnnotationManager()

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

    @property
    def picture_url(self):
        if self.picture:
            return self.picture.url
        return ''

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

    @property
    def next(self):
        return Animal.objects.filter(section__slug=self.section.slug,
                                     position__gt=self.position).order_by('position').first()

    @property
    def prev(self):
        return Animal.objects.filter(section__slug=self.section.slug,
                                     position__lt=self.position).order_by('position').last()
