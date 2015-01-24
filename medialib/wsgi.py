"""
wsgi Datei fuer Apache2
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
import os
import sys
import site

# System Path
sys.path.append('/var/oos/ml')
sys.path.append('/var/oos/ml/medialib')

# Settings
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "medialib.settings")

# run Application
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()