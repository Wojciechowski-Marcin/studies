#!/bin/bash

find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete
rm db.sqlite3
python3 manage.py makemigrations
python3 manage.py migrate --fake-initial
python3 manage.py shell < createSU.py
python3 manage.py loaddata initial_data.json