#!/bin/bash

# Author: Mohammad Ghahremani(libnist)
# Creation date: 07/04/2023
# Last modifier: 07/04/2023

# Description:
# Automatically make one commit per day in GitHub.

# Usage:
# still none.

while getopts d:u: flag
do
    case "${flag}" in
        d) dir=${OPTARG};;
        u) url=${OPTARG};;
    esac
done

if [ -z "$dir" ] 
then
    # Set initial values
    dir=$(pwd)
fi

if [ -z "$url" ] 
then
    # Empty url, exit
    echo "u flag is not defined"
    exit 1
fi

wd=$(pwd)

# Create a directory
mkdir -p $dir
echo "Created the project directory at: $dir"

# Go to the created dir, init git
cd $dir
git init 1>/dev/null 2>/dev/null
echo "Initialized git repo at: $dir"

# Create a text file and make the first commit
echo "{\"date\": \"$(date +%d-%m-%y_%H:%M:%S)\", \"count\": \"0\"}" 1> commits.json
cp $wd/gac.sh $wd/update.sh $dir/
git add . 1>/dev/null 2>/dev/null
git commit -m "first commit." 1>/dev/null 2>/dev/null

git remote add origin $url 1>/dev/null 2>/dev/null
git push -u origin master 1>/dev/null 2>/dev/null

crontab -l > cron
echo "0 22 * * * cd $dir; $dir/update.sh" >> cron
crontab cron
rm cron

exit 0