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
