#!/bin/sh

# Run with env file
docker run --name l2tp --env-file l2tp.env -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -d --privileged matrixanger/l2tp-ios
# docker run --name l2tp -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -d --privileged hwdsl2/ipsec-vpn-server

# Generate mobileconfig file
docker exec l2tp generate-mobileconfig > l2tp.mobileconfig
