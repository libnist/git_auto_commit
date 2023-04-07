#!/bin/bash


last_date=$(grep -o '"date": "[^"]*' commits.json | grep -o '[^"]*$')
count=$(grep -o '"count": "[^"]*' commits.json | grep -o '[^"]*$')

count=$(expr $count + "1")
current_date=\"$(date +%d-%m-%y_%H:%M:%S)\"
output="{\"date\": $current_date, \"count\": \"$count\"}"

echo $output 1> commits.json


git add .
git commit -m "Commited for $count times. last commit was: $last_date"
git push -u origin master

exit 0



