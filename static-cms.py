#!/usr/bin/python
import os
import sys

## Run gather lms static
user_edxapp = os.system('id -u edxapp')
os.setuid(user_edxapp)
os.chdir('/edx/app/edxapp/edx-platform')
os.system('. ../edxapp_env; paver update_assets cms --settings=aws')

## Exit
sys.exit()