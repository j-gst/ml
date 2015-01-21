"""
WSGI config for medialib project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/
"""

import os
import sys
import site


sys.path.append('/var/oos/ml')
sys.path.append('/var/oos/ml/medialib')


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "medialib.settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()