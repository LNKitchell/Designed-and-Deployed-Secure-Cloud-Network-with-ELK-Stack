# shell script to return the County an IP address is coming from
curl -s http://ipinfo.io/$1 | grep country | awk -F: '{print $2}'
