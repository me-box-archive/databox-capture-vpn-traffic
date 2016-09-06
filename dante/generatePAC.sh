#!/bin/bash
serverip=`ifconfig eth0 | awk '/inet addr/{print substr($2,6)}'`

cat > dante.pac << EOF
function FindProxyForURL(url, host){
    return "SOCKS $serverip:1080";
}
EOF
