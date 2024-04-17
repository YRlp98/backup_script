# backup_script

A script to back up MySQL database, env files, images, and Apache configs and transfer them to another remote server.

## Usage

1. Navigate to the Backups directory:
```cd backups```

2. Modify/Save the Script:
```nano backup_script.sh```

3. Make the Script Executable:
```chmod +x backup_script.sh```

4. Execute the Script:
```./backup_script.sh```

This will run the backup script and transfer the backups to the remote server.



## Automate Backups Using Cron Job

To schedule the backup script to run automatically, you can set up a cron job:

1. Open the crontab for editing:
```crontab -e```

2. Add the following line to the crontab to run the backup script every day at 6:00 AM:
```0 6 * * * /home/backups/backup_script.sh```


This will execute the backup script daily at 6:00 AM. Adjust the path to `backup_script.sh` according to your directory structure if necessary.
