from django.utils import timezone


__all__ = (
    'month',
)


class Month:

    @property
    def current(self):
        return timezone.now().month

    @property
    def next(self):
        return self.current + 1 if self.current < 12 else 1

    @property
    def previous(self):
        return self.current - 1 if self.current > 1 else 12

    @staticmethod
    def get_name(date):
        return date.strftime("%B")


month = Month()
