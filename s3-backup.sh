#!/bin/bash

# This code need to run using cronjob in linux system, add to cronjob using this command
# crontab -e
# add this code to run backup everyday:
# 00 00 * * * /bin/sh /path/s3backup.sh
# Made with <3 by Darth edXius <rizky@indonesiax.co.id>

# Set datetime using date +%F (Format: YYYY-MM-DD)
DAY_TIME=$(date +%F)

# This command to dump database to local storage 
# Password setting must be input in ~/.my.cnf file using the format:
# [mysqldump]
# password=yourpassword
mysqldump -u username databasename > /path/edxius_$DAY_TIME.sql

# This command sync local storage to s3
aws s3 sync /path/ s3://storage-name/
