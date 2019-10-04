from acnl.settings.base import *

DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1']

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
