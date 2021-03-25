#!/bin/bash

echo "Check changes in models"
python manage.py makemigrations --dry-run
python manage.py compilesass

if    ls -1qA /var/www/django/acnl/media | grep -q .
then  ! echo Media is not empty
else  unzip ./units.zip -d /var/www/django/acnl/media
fi

python manage.py runserver 0.0.0.0:8000
