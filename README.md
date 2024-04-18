# backup_script

A script to back up MySQL database, env files, images, and Apache configs and transfer them to another remote server.

## Usage

1. Navigate to your Backups directory:
```cd backups```

2. Modify/Save the Script:
```nano backup_script.sh```

3. Make the Script Executable:
```chmod +x backup_script.sh```

4. Execute the Script:
```./backup_script.sh```


You can add it to a cron job to schedule and automatically run it.

5. Set up Cron Job:Open the crontab file:
```crontab -e```

Add the following lines to execute the cleanup_script.sh daily at midnight and the backup_script.sh at system reboot:
```
0 0 * * * /path/to/cleanup_script.sh
```

## Cleanup Script

Replace /path/to/cleanup_script.sh and /path/to/backup_script.sh with the actual paths to your cleanup and backup scripts respectively.

6. Cleanup Script:A cleanup script (cleanup_script.sh) is provided to delete old backups and keep only the 3 most recent backups.Ensure the cleanup_script.sh is executable:
```chmod +x cleanup_script.sh```

You can add the cleanup script to your crontab to run it automatically.Example crontab entry to run cleanup_script.sh daily at midnight:
```
0 0 * * * /path/to/cleanup_script.sh
```

Make sure to replace `/path/to/cleanup_script.sh` and `/path/to/backup_script.sh` with the actual paths to your cleanup and backup scripts respectively. After updating the README, users will have clear instructions on how to use the cleanup script in conjunction with the backup script.
