from django.shortcuts import render

from encyclopedia.models import Month, Unit
from encyclopedia.views.encyclopedia import EncyclopediaView


class UnitView(EncyclopediaView):

    def get(self, request, pk):
        unit = Unit.objects.filter(pk=pk).select_related('section').first()
        next_unit = Unit.objects.filter(section=unit.section, id__gt=unit.id).order_by('id').first()
        prev_unit = Unit.objects.filter(section=unit.section, id__lt=unit.id).order_by('id').last()
        context = {
            'mon': self.get_current_month(),
            'months': Month.objects.all(),
            'rarity_range': range(0, unit.rarity),
            'unit': unit,
            'next': next_unit,
            'prev': prev_unit,
            'last': self.is_last_month(unit)
        }
        return render(request, 'pages/unit.html', context)
