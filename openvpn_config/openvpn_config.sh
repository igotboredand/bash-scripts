#!/bin/bash

# This script creates a universal ovpn file for your openvpn client. 
# You will need the necessary files below in your current directory for this to work. 
# Necessary files: <client-name>.crt, <client-name>.key, ca.crt, ta.key


# Usage: $ openvpn_config.sh <client-name>


cat ./base.conf \
    <(echo -e '<ca>') \
    ./ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ./${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ./${1}.key \
    <(echo -e '</key>\n<tls-auth>') \
    ./ta.key \
    <(echo -e '</tls-auth>') \
    > ./${1}.ovpn
