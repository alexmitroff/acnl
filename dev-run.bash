#!/bin/bash

python manage.py compilesass
python manage.py runserver 0.0.0.0:8000
