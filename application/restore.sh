#!/usr/bin/env sh

STATUS=0

echo "restic-backup-restore: restore: Started"
echo "restic-backup-restore: Restoring ${RESTIC_RESTORE_ID} to ${TARGET_PATH}"

start=$(date +%s)
/usr/local/bin/restic restore ${RESTIC_RESTORE_ID} --host ${RESTIC_HOST} --tag ${RESTIC_TAG} --target ${TARGET_PATH} || STATUS=$?
end=$(date +%s)

if [ $STATUS -ne 0 ]; then
	echo "restic-backup-restore: FATAL: Restore returned non-zero status ($STATUS) in $(expr ${end} - ${start}) seconds."
	exit $STATUS
else
	echo "restic-backup-restore: Restore completed in $(expr ${end} - ${start}) seconds."
fi

start=$(date +%s)
/usr/local/bin/restic unlock || STATUS=$?
end=$(date +%s)

if [ $STATUS -ne 0 ]; then
	echo "restic-backup-restore: FATAL: Repository unlock returned non-zero status ($STATUS) in $(expr ${end} - ${start}) seconds."
	exit $STATUS
else
	echo "restic-backup-restore: Repository unlock completed in $(expr ${end} - ${start}) seconds."
fi

echo "restic-backup-restore: restore: Completed"
exit $STATUS
