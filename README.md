# Animal Crossing New Leaf Encyclopedia
This is simple django project which I use to learn markup, caching, REST & etc.

## Local deploy

### Create python env and clone project
```bash
python3.x -m venv .acnl
source .acnl/bin/activate

git clone git@gitlab.com:alexmitroff/acnl.git
```

### Restore database from sql backup
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
terminal:
```bash
# Install postgres any way you wanted

su - postgres
psql
# in postgres shell:
create database acnl_db;
create user acnl with password 'password1234';
grant all privileges on database acnl_db to acnl;
\q # or Ctrl+d

psql acnl < ./acnl/database.sql
```

### Install requirements, compile styles and run development server 
```bash
cd acnl
pip install -r requirements.txt

# We need to generate CSS
python manage.py compilesass # it will generate /static/css/acnl.gen.css (minimized)
python manage.py runserver 0.0.0.0:8000
```

