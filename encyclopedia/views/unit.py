from django.shortcuts import render, get_object_or_404

from encyclopedia.models import Month, Unit
from encyclopedia.views.encyclopediabase import EncyclopediaBase


class UnitView(EncyclopediaBase):

    def get(self, request, pk):
        unit = get_object_or_404(Unit, pk=pk)
        next_unit = Unit.objects.filter(section_id=unit.section_id, id__gt=unit.id).order_by('id').first()
        prev_unit = Unit.objects.filter(section_id=unit.section_id, id__lt=unit.id).order_by('id').last()
        months = Month.objects.all()
        months = self.mark_active_month(months, unit)
        context = {
            'mon': self.get_current_month(),
            'months': months,
            'rarity_range': range(0, unit.rarity),
            'unit': unit,
            'next': next_unit,
            'prev': prev_unit,
            'last': self.is_last_month(unit),
            # Additional
            'page_title': unit.name,
        }
        return render(request, 'pages/unit.html', context)
