#!/bin/bash

# Set database credentials
DB_USER=""
DB_PASS=""
DB_NAME=""

# Set backup directory
CURRENT_DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="/$CURRENT_DATE"

# Set remote server details
REMOTE_SERVER=""
REMOTE_PORT=""
REMOTE_USER=""
REMOTE_PASSWORD=""
REMOTE_BACKUP_DIR=""

# Set paths to Apache configs, env files, and images
APACHE_CONFIG_DIR=""
ENV_FILES_DIR=""
IMAGES_DIR=""

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Database backup
mariabackup --user="$DB_USER" --password="$DB_PASS" --target-dir="$BACKUP_DIR/database_backup" > /dev/null
mysqldump --user="$DB_USER" --password="$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/database_backup.sql"

# Backup env files
cp -r "$ENV_FILES_DIR" "$BACKUP_DIR/env_files"

# Backup images
cp -r "$IMAGES_DIR" "$BACKUP_DIR/images"

# Get backup of Apache configs
sudo tar -czvf "$BACKUP_DIR/apache2_backup.tar.gz" "$APACHE_CONFIG_DIR"

# Tar the backup directory with the current date
tar -czvf "/tmp/$CURRENT_DATE.tar.gz" "$BACKUP_DIR"

# Transfer backup to remote server
echo "$REMOTE_PASSWORD" | sshpass -p "$REMOTE_PASSWORD" scp -P "$REMOTE_PORT" "/tmp/$CURRENT_DATE.tar.gz" "$REMOTE_USER@$REMOTE_SERVER:$REMOTE_BACKUP_DIR"

# Remove Apache backup after transfer
rm -f "$BACKUP_DIR/apache2_backup.tar.gz"

# Delete everything inside the backup directory except backup_script.sh
find "$BACKUP_DIR" -mindepth 1 ! -name 'backup_script.sh' -delete

# Remove backup directory after transfer
rm -rf "$BACKUP_DIR"

# Message indicating completion
echo "All backup tasks completed successfully."