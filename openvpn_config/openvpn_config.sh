#!/bin/bash


# Usage: $ openvpn_config.sh <client-name>

# This script creates a universal ovpn file for your openvpn client. 
# You will need the necessary files below in your current directory for this to work. 
# Necessary files: client.conf, <client-name>.crt, <client-name>.key, ca.crt, ta.key


# if client.conf doesn't exist in the current directory; then copy the config from its default location (on ubuntu / debian. YMMV.)
if [ ! -f ./client.conf ] && [ -f /usr/share/doc/openvpn/examples/sample-config-files/client.conf ]; then
    cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf ./base.conf
else
    echo "You need client.conf in the current directory, or the openvpn sample config in its default location."
    exit 1 
fi

cat ./client.conf \
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


