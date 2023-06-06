#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python /app/manage.py collectstatic --noinput

gunicorn config.wsgi --bind 0.0.0.0:5000 --chdir=/app

python manage.py migrate