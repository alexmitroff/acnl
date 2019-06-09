from encyclopedia.models import Section, Unit


class Naturalist:
    """Class that retrieves currect creatures from DB

    usage:
        ```
        from encyclopedia.models import Month
        from encyclopedia.naturalist import Naturalist

        # lets get january
        month = Month.objects.get(pos=1)

        naturalist = Naturalist(month)
        naturalist.remember_creature_classification()
        creatures_that_will_disappear_in_february = naturalist.last_month_creatures
        creatures_that_just_appeared_in_january = naturalist.just_appeared_creatures

        ```

    """
    def __init__(self, month):
        self.month = month
        self.sections = Section.objects.none()

    def remember_creature_classification(self):
        self.sections = Section.objects.filter(show=True).order_by('pos').values_list('name', flat=True)

    def will_the_creature_disappear(self, unit):
        return not self.month.next_month in unit.months.all()

    def did_the_creature_just_appear(self, unit):
        return not self.month.prev_month in unit.months.all()

    def is_the_creature_available(self, unit):
        return self.month in unit.months.all()

    def _get_creatures_by_month(self, query_month):
        unit_dict = {}
        for section in self.sections:
            units = Unit.objects.filter(section__name=section, months__name=self.month.name)\
                .exclude(months__name=query_month.name).order_by('pos').values('id', 'name', 'pic', 'rarity')
            unit_dict[section] = units
        return unit_dict

    @property
    def last_month_creatures(self):
        return self._get_creatures_by_month(self.month.next_month)

    @property
    def just_appeared_creatures(self):
        return self._get_creatures_by_month(self.month.prev_month)

    @property
    def all_creatures(self):
        unit_dict = {}
        for section in self.sections:
            units = Unit.objects.filter(section__name=section).order_by('pos').values('id', 'name', 'pic', 'rarity')
            unit_dict[section] = units
        return unit_dict

