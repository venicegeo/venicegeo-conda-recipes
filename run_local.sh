#!/bin/bash

user=$1
pass=$2
channel_url=$3

creds_channel_url=https://$user:$pass@$channel_url
channel_url=https://$channel_url

cp recipe-script.sh temp.sh
chmod +x temp.sh

sed -i "s*SED_LOC*$HOME*g" temp.sh
sed -i "s*SED_USER*$user*g" temp.sh
sed -i "s*SED_PASS*$pass*g" temp.sh
sed -i "s*SED_CHANNEL*$channel_url*g" temp.sh
sed -i "s*SED_CREDS_CHANNEL*$creds_channel_url*g" temp.sh

./temp.sh

rm temp.sh
