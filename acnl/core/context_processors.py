def project_info(request):
    from django.conf import settings
    import django
    return {
        'PROJECT_VERSION': settings.PROJECT_VERSION,
        'DJANGO_VERSION': django.get_version(),
    }
