#!/bin/bash
#Ylan Segal

#Print Usege
echo "Will attempt to Download QB Data from Ofbiz"

SERVER=https://www.camerabatterydepot.com
LOGIN_URL=/accounting/control/login
DOWNLOAD_URL=/accounting/control/DataExportForQb.iif

#Promting for data
echo "Enter dates in YYYY-MM-DD format"
#echo "Start Date: "
read -p "Start Date: " START_DATE
read -p "End Date: " END_DATE
if [ -z "$END_DATE" ]; then
	END_DATE=$START_DATE
fi
read -p "Username: " USERNAME 
read -s -p "Password: " PASSWORD

#CLEANING UP SPACES IN PASSWORD
PASSWORD=`echo $PASSWORD | sed 's/ /\+/'`

#CREATING URL
LOGIN_URL="$LOGIN_URL?USERNAME=$USERNAME&PASSWORD=$PASSWORD"
echo $LOGIN_URL

#Getting wget to login
	

wget --spider --no-check-certificate \
     --save-cookies=cookies --keep-session-cookies \
     $SERVER$LOGIN_URL

#Downloading file
wget --no-check-certificate \
	--load-cookies cookies \
     --save-cookies=cookies --keep-session-cookies \
     -O CbdExport$START_DATE-$END_DATE.iif \
     "$SERVER$DOWNLOAD_URL?organizationPartyId=CbdCompany&fromDate=$START_DATE+00:00:0.000&thruDate=$END_DATE+0:00:0.000"

wget --no-check-certificate \
	--load-cookies cookies \
     --save-cookies=cookies --keep-session-cookies \
     -O LbdExport$START_DATE-$END_DATE.iif \
     "$SERVER$DOWNLOAD_URL?organizationPartyId=LbdCompany&fromDate=$START_DATE+00:00:0.000&thruDate=$END_DATE+0:00:0.000"

     
#Cleaning up cookies
rm cookies
