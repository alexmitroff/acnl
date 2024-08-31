from datetime import datetime


__all__ = (
    'month',
)


class Month:

    @property
    def current(self):
        return datetime.now().month

    @property
    def next(self):
        return self.current + 1 if self.current < 12 else 1

    @property
    def previous(self):
        return self.current - 1 if self.current > 1 else 12


month = Month()
