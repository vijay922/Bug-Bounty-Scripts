#!/bin/bash

# Get domain name from user input
cat $1 | while read domain; do 

# Use whois command to get information about the domain
whois_result=$(whois $domain)

# Use grep to extract the domain name and Registrant Organization
domain_name=$(echo "$whois_result" | grep -m 1 "Domain Name:" | awk '{print $NF}')
registrant_org=$(echo "$whois_result" | grep -m 1 "Registrant Organization:" | awk '{$1=""; print $0}')

# Print the results
echo "Domain Name: $domain_name" "Registrant Organization: $registrant_org"

done
