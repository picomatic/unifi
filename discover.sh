#!/bin/bash  

#Your Access Point MAC address below 
MacAddress="${MacAddress} 00:00:00:00:00:00"

#user name of admin account on controller 
username="your_username_here_between_quotes"

#password of admin account on controller 
password="your_password_here_between_quotes"

#controller IP address and port 
baseurl=https://192.168.1.32:8443

#leave as default 
site=default

cookie=/tmp/cookie
curl_cmd="curl -v --silent --cookie ${cookie} --cookie-jar ${cookie} --insecure" 
${curl_cmd} --data "{\"username\":\"$username\", \"password\":\"$password\"}" $baseurl/api/login 

for mac in ${MacAddress}; 
  do ${curl_cmd} $baseurl/api/s/$site/stat/device/${mac} 
done 
${curl_cmd} $baseurl/logout

