#!/bin/bash
# Ylan Segal
# Uses gdd.py to download Google Docs to Dropbox Backup folder

. ~/.profile
PYTHON=/usr/bin/python
BACKUP_TO=~/Dropbox/Backups/GoogleDocs
EMAIL=ylan@alxglobal.com
PASS=4go10code
OUTPUT=lastOutput.txt

cd $BACKUP_TO
date > $OUTPUT
echo >> $OUTPUT
$PYTHON ~/bin/gdd.py --modified-only --email=$EMAIL --password=$PASS >> $OUTPUT
