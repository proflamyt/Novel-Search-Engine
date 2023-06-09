#!/usr/bin/env bash

set -o errexit  # exit on error

pip install -r requirements.txt
cd DocumentSearch/
python manage.py collectstatic --no-input
python manage.py migrate
python manage.py populate_db
python manage.py search_index --rebuild -f