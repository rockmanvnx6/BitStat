#!/bin/bash

# Script by Jia Jun Yong, 2019
#
# GOAL: To setup and configure BitStat server

workdir=$(pwd)
pythonwhr=$(which python3)

echo "Welcome to BitStat Server Configurator!"
echo "============================"

echo "Please enter the name of your Google Cloud Storage Bucket for this project:"

read bucketname

echo "Replacing bucket name in scripts..."
replacestr="s@REPLACE@$bucketname@g"
sed -i $replacestr upload_hourly_json_files_to_google.py
sed -i $replacestr upload_weekly_json_files_to_google.py
sed -i $replacestr upload_daily_json_files_to_google.py
sed -i $replacestr upload_15mins_before_json_files_to_google.py

echo "Replacing working directory in scripts..."
replacedir="s@REPLACE@$workdir@g"
replacepythondir="s@PYTHON@$pythonwhr@g"
sed -i $replacedir upload_files_to_google_daily.sh
sed -i $replacepythondir upload_files_to_google_daily.sh
sed -i $replacedir upload_files_to_google_hourly.sh
sed -i $replacepythondir upload_files_to_google_hourly.sh
sed -i  $replacedir upload_files_to_google_last15.sh
sed -i  $replacepythondir upload_files_to_google_last15.sh
sed -i  $replacedir upload_files_to_google_weekly.sh
sed -i  $replacepythondir upload_files_to_google_weekly.sh
sed -i  $replacedir crontab.txt
sed -i  $replacepythondir crontab.txt

echo "Fixing CORS on Google Cloud Storage..."
echo ""
echo "Please enter the link of your bucket on Google Cloud Storage in full (starting with gs://...):"

read bucketlink

gsutil cors set cors-json-file.json $bucketlink

echo "Setting up crontab from crontab.txt..."
crontab crontab.txt

echo "Making directories for data output..."
mkdir 15mins_json_file_backup
mkdir bitcoin_files_15mins
mkdir bitcoin_files_15mins_backup
mkdir bitcoin_files_hourly
mkdir bitcoin_files_hourly_backup
mkdir bitcoin_mean_hourly_backup
mkdir daily_json_file_backup
mkdir hourly_csv_files_backup
mkdir hourly_json_file_backup
mkdir weekly_json_file_backup

echo "Configuring API script for Google Cloud Function with specified bucket name..."
replacefunc="s@REPLACE@$bucketname@g"
sed -i  $replacefunc cloudfunction.py

echo "Successfully configured BitStat Server!"
echo "Please follow README.md to configure API on Google Cloud Function."