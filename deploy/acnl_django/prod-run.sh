#!/bin/bash

echo "Check changes in models"
if [[ $(python manage.py makemigrations --dry-run) != 'No changes detected' ]]; then
  echo "There are unapplied changes to models"
  exit 1
fi

echo "Checking migrations"
if [[ $(python manage.py showmigrations --list | grep '\[ \]') ]]; then
    echo "There are unapplied migrations"
    python manage.py migrate
else
    echo "All migrations are applied"
fi

python manage.py compilesass

python manage.py collectstatic --noinput

echo "Checking media"
if    ls -1qA $MEDIA_ROOT_PATH | grep -q .
then  ! echo Media is not empty
else  unzip ./units.zip -d $MEDIA_ROOT_PATH
fi

gunicorn -w 4 acnl.wsgi -b 0.0.0.0:8000
