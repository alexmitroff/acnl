# Animal Crossing New Leaf Encyclopedia
This is simple django project which I use to learn markup, caching, REST & etc.

**Table of content**
- [Animal Crossing New Leaf Encyclopedia](#animal-crossing-new-leaf-encyclopedia)
  - [Local deploy without `docker`](#local-deploy-without-docker)
    - [Create python env and clone project](#create-python-env-and-clone-project)
    - [Restore database from sql backup](#restore-database-from-sql-backup)
    - [Install requirements, compile styles and run development server](#install-requirements-compile-styles-and-run-development-server)
  - [Local deploy with `docker compose`](#local-deploy-with-docker-compose)
    - [Restore database from sql backup](#restore-database-from-sql-backup-1)
    - [Run development server](#run-development-server)
    - [Run production server](#run-production-server)


## Local deploy without `docker`

### Create python env and clone project
```bash
python3.x -m venv .acnl
source .acnl/bin/activate

git clone git@gitlab.com:alexmitroff/acnl.git
```

### Restore database from sql backup
terminal:
```bash
# Install postgres any way you wanted
# log in as postgres user
su - postgres
# enter the postgres shell
psql
# in postgres shell:
CREATE DATABASE acnl_db;
CREATE USER acnl WITH PASSWORD 'password1234';
GRANT ALL PRIVILEGES ON DATABASE acnl_db TO acnl;
ALTER DATABASE acnl_db OWNER TO acnl;
\q # or Ctrl+d
# restore from sql file
psql acnl < ./acnl/database.sql
```
settings.py:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'acnl_db',
        'USER': 'acnl',
        'PASSWORD': 'password1234',
        'HOST': 'localhost',
        'PORT': '',
        }
}
```
### Install requirements, compile styles and run development server
```bash
cd acnl
pip install -r requirements.txt

# We need to generate CSS
python manage.py compilesass # it will generate /static/css/acnl.gen.css (minimized)
python manage.py runserver 0.0.0.0:8000
```

## Local deploy with `docker compose`

### Restore database from sql backup
part of docker-compose:
```yaml
services:
  postgres:
    image: "postgres:11"
    container_name: "acnl_postgres"
    ports:
      - "54320:5432"
    volumes:
      - "dbdata:/var/lib/postgresql/data"

volumes:
  dbdata:
```
terminal:
```bash
docker-compose -f local.yml up
# enter the postgres shell
docker exec -it acnl_postgres psql -U postgres

# in postgres shell:
CREATE DATABASE acnl_db;
CREATE USER acnl WITH PASSWORD 'password1234';
GRANT ALL PRIVILEGES ON DATABASE acnl_db TO acnl;
ALTER DATABASE acnl_db OWNER TO acnl;
\q # or Ctrl+d

# restore from sql file
cat ./database.sql | docker exec -i acnl_postgres psql -U acnl -d acnl_db
docker-compose down
```
settings.py:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'acnl_db',
        'USER': 'acnl',
        'PASSWORD': 'password1234',
        'HOST': 'postgres',
        'PORT': '5432',
        }
}
```

### Run development server
```bash
docker compose -f local.yml up
```

### Run production server
Specify **acnl/settings/prod.py:**
```python
from acnl.settings.base import *

DEBUG = False

ALLOWED_HOSTS = ['mydomain.here']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'acnl_db',
        'USER': 'acnl',
        'PASSWORD': 'password1234',
        'HOST': 'postgres',
        'PORT': '5432',
        }
}

STATIC_ROOT = "/var/www/django/acnl/static"
MEDIA_ROOT = "/var/www/django/acnl/media"
```
```bash
docker compose -f prodaction.yaml up
```