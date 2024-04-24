#!/bin/bash

# Set the directory where backup files are stored
BACKUP_DIR="/root/backups"

# Change to the backup directory
cd "$BACKUP_DIR" || exit

# Get a list of all backup files sorted by modification time (oldest first)
backup_files=$(ls -t)

# Count the number of backup files
num_files=$(echo "$backup_files" | wc -l)

# Check if there are more than 3 backup files
if [ "$num_files" -gt 3 ]; then
    # Calculate the number of files to delete
    num_to_delete=$((num_files - 3))
    
    # Delete the oldest backup files
    echo "Deleting $num_to_delete old backup files..."
    echo "$backup_files" | tail -n "$num_to_delete" | xargs rm
    echo "Old backup files deleted."
else
    echo "No old backup files to delete."
fi
