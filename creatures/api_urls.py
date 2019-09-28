from django.urls import path, include

app_name = "api-creatures"

urlpatterns = [
    path('', include('creatures.api.creature.urls'))
]