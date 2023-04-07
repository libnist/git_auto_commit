#!/bin/bash

# Author: Mohammad Ghahremani(libnist)
# Creation date: 07/04/2023
# Last modifier: 07/04/2023

# Description:
# Updates a json file and commits it to github.

# Usage:
# just run the script.

# Reading last_date and count
last_date=$(grep -o '"date": "[^"]*' commits.json | grep -o '[^"]*$')
count=$(grep -o '"count": "[^"]*' commits.json | grep -o '[^"]*$')

# Updating the file
count=$(expr $count + "1")
current_date=\"$(date +%d-%m-%y_%H:%M:%S)\"
output="{\"date\": $current_date, \"count\": \"$count\"}"

echo $output 1> commits.json

# Commiting and pushing it into the remote repo.
git fetch
git add .
git commit -m "Commited for $count times. last commit was: $last_date"
git push -u origin master

exit 0



