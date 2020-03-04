# restic-backup-restore
Docker image to initialize, backup to, and restore from a Restic repository on AWS S3.

## How to use it
1. Create an S3 bucket to hold your backups
2. Supply all appropriate environment variables
3. Initialize the Restic repository on S3 to hold the backups (one-time only)
4. Run a backup and check your bucket for that backup

### Environment variables
1. `AWS_ACCESS_KEY_ID` - used for S3 interactions

2. `AWS_SECRET_ACCESS_KEY` - used for S3 interactions

3. `AWS_DEFAULT_REGION` - AWS default region for S3 bucket 

4. `FSBACKUP_MODE=[init|backup|restore]` - `init` initializes the Restic repository at `$RESTIC_REPOSITORY` (only do this once); `backup` performs a backup; `restore` performs a restoration.

5. `RESTIC_BACKUP_ARGS` - additional arguments to pass to 'restic backup' command

6. `RESTIC_FORGET_ARGS` - additional arguments to pass to 'restic forget --prune' command (e.g., --keep-daily 7 --keep-weekly 5  --keep-monthly 3 --keep-yearly 2)

7. `RESTIC_HOST` - hostname to be used for the backup

8. `RESTIC_PASSWORD` - password for the Restic repository

9. `RESTIC_REPOSITORY` - Restic repository location (e.g., 's3:s3.amazonaws.com/bucketname/restic')

10. `RESTIC_TAG` - tag to apply to the backup

11. `SOURCE_PATH` - full path to the source directory to be backed up

12. `TARGET_PATH` - full path to the target directory to be restored to (usually the same as the SOURCE\_PATH)

It's recommended that your S3 bucket **NOT** have versioning turned on.
Old versions of Restic's repository files are not useful.

## Docker Hub
This image is built automatically on Docker Hub as [silintl/restic-backup-restore](https://hub.docker.com/r/silintl/restic-backup-restore/)
