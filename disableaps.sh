#!/bin/bash 

#Put here all of the AP IDs 
DeviceID="${DeviceID} xxxxxxxxxxxxxxxxxxxxxxxxx"
#DeviceID="${DeviceID} yyyyyyyyyyyyyyyyyyyyyyyyy"  

#user name of admin account on controller 
username="your_username_here_between_quotes"   

#password of admin account on controller 
password="your_password_here_between_quotes"   

#controller IP address and port 
baseurl=https://192.168.1.32:8443

#leave as default 
site=default 

#cookie location
cookie=/tmp/cookie 

#curl command
curl_cmd="curl -v --silent --cookie ${cookie} --cookie-jar ${cookie} --insecure" 
${curl_cmd} --data "{\"username\":\"$username\", \"password\":\"$password\"}" $baseurl/api/login  

for device in ${DeviceID}; 
  do ${curl_cmd} -X PUT -H "Content-Type: application/json" --data "json={\"disabled\":true}" $baseurl/api/s/$site/rest/device/${device}
done  

${curl_cmd} $baseurl/logout

