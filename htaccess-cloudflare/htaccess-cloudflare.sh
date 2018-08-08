#!/bin/bash

# This script creates an htaccess file that only allows traffic to cloudflare's resolvers. 

# Usage: $ bash cloudflare-htaccess.sh

echo "# .htaccess file created at: " `date` > .htaccess

# Set the order to process Allow entries before Deny
echo "Order Allow,Deny" >> .htaccess

# Download and add ipv4 addresses
for x in `curl https://www.cloudflare.com/ips-v4`
     do
       echo "Allow from " $x >> .htaccess
     done

# Download and add ipv6 addresses
for x in `curl https://www.cloudflare.com/ips-v6`
    do
      echo "Allow from " $x >> .htaccess
    done

# Deny traffic from everywhere else
echo "Deny from *" >> .htaccess
