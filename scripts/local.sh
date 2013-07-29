#!/bin/bash
set -e
# variaveis
ADMIN_USER='admin'
ADMIN_PASSWORD='admin'
ADMIN_EMAIL='admin@mail.com.br'
SITENAME="localhost:8000"
PYTHON="./venv/bin/python"
PROJECT_PATH="wsgi/openshift"
set -x
# virtualenv
if [ ! -d venv ]; then
    virtualenv --no-site-packages venv
fi
# install requirements.txt
./venv/bin/pip install -r $PROJECT_PATH/requirements.txt
# delete DB (sqlite)
rm -f $PROJECT_PATH/dev.db
# and syncdb
$PYTHON $PROJECT_PATH/manage.py syncdb --noinput
# create admin account
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', '$ADMIN_EMAIL', '$ADMIN_PASSWORD')" | $PYTHON $PROJECT_PATH/manage.py shell
# runserver
$PYTHON $PROJECT_PATH/manage.py runserver
