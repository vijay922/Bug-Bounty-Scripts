#!/bin/bash

# Get domain name from openssl
cat $1 | while read domain; do 
openssl s_client -showcerts -connect $domain:443 </dev/null 2>/dev/null | openssl x509 -noout -text | awk '/Subject Alternative Name:/ {getline; print}' | sed -e 's/DNS://g' -e 's/X509v3 Subject Alternative Name://g' -e 's/,//g'  | tr ' ' '\n' | sort -u >> out.txt
done
