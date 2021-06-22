#!/bin/bash

output=$(terraform output -json vmset)
len=$(echo $output | jq length)

for i in $( seq 0 $(($len - 1)) ); do
    map=$(echo $output | jq -r ".\"$i\"")
    public_dns=$(echo $map | jq -r ".public_dns")
    instance_name=$(echo $map | jq -r ".instance_name")
    echo -e "${public_dns}\t${instance_name}"
done
