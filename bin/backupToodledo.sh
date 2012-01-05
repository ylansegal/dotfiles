#!/bin/sh
# Ylan Segal
. ~/.profile

# Backups toodledo.com data from website
WGET=/opt/local/bin/wget


#cd ~/Dropbox/Backups

$WGET -O /dev/null --no-check-certificate --save-cookies cookies.txt --post-data 'email=ylan@aliagrp.com&pass=tummybed65' https://www.toodledo.com/signin.php

#$WGET --load-cookies cookies.txt http://www.toodledo.com/xml.php
#mv toodledo.xml ~/Dropbox/Backups/toodledo.xml
#rm cookies.txt
#rm signin.php