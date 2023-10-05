#!/usr/bin/env sh

STATUS=0

echo "restic-backup-restore: init: Started"

start=$(date +%s)
/usr/local/bin/restic init || STATUS=$?
end=$(date +%s)

if [ $STATUS -ne 0 ]; then
	echo "restic-backup-restore: FATAL: Repository initialization returned non-zero status ($STATUS) in $(expr ${end} - ${start}) seconds."
	exit $STATUS
else
	echo "restic-backup-restore: Repository initialization completed in $(expr ${end} - ${start}) seconds."
fi

echo "restic-backup-restore: init: Completed"
exit $STATUS
