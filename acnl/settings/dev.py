from acnl.settings.base import *

ALLOWED_HOSTS = ['localhost', '127.0.0.1']
INTERNAL_IPS = ['localhost', '127.0.0.1', '172.20.0.1']

INSTALLED_APPS += [
    'debug_toolbar',
]

MIDDLEWARE += [
    'debug_toolbar.middleware.DebugToolbarMiddleware',
]