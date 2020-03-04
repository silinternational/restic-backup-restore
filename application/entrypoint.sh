#!/usr/bin/env sh

STATUS=0

case "${FSBACKUP_MODE}" in
	INIT|BACKUP|RESTORE)
		/data/${FSBACKUP_MODE}.sh || STATUS=$?
		;;
	*)
		echo restic-backup-restore: FATAL: Unknown FSBACKUP_MODE: ${FSBACKUP_MODE}
		exit 1
esac

if [ $STATUS -ne 0 ]; then
	echo restic-backup-restore: Non-zero exit: $STATUS
fi

exit $STATUS
