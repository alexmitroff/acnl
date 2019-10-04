#!/bin/bash

echo "Check changes in models"
python manage.py makemigrations --dry-run
python manage.py compilesass
python manage.py runserver 0.0.0.0:8000
