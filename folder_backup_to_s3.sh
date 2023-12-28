#!/bin/bash

# Define variables
local_folder="/path/to/local/folder"
s3_bucket="your-s3-bucket-name"
s3_backup_folder="backup-folder"

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# Check if the local folder exists
if [ ! -d "$local_folder" ]; then
    echo "Local folder does not exist: $local_folder"
    exit 1
fi

# Sync local folder with S3 bucket
aws s3 sync "$local_folder" "s3://$s3_bucket/$s3_backup_folder" --delete

# Check the exit code of the AWS CLI command
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed. Please check the error message above."
fi
