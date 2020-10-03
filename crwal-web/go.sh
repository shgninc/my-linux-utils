#!/bin/bash
#http://stackoverflow.com/questions/12399087/curl-to-access-a-page-that-requires-a-login-from-a-different-page
name=$1
pass=$2
url=$3
File="/tmp/toos.cki"

curl -s -H "application/x-www-form-urlencoded" --cookie-jar $File \
     --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0" --data normal_username="$name" \
     --data normal_password="$pass" --data lang="fa" --data x="15" --data y="13" --request POST '$url'

curl -s --cookie $File 'target URL' | grep "<sub>G</sub>" | cut -f 3 -d \t | awk '{ print $4; }' | cut -f 1 -d '<'

if [ -f $File ]; then
   rm $File
fi
