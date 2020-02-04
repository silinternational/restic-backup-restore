#!/usr/bin/env sh

logger -p user.info "Started backup..."

start=$(date +%s)
runny /usr/local/bin/restic backup --tag ${RESTIC_TAG} ${RESTIC_BACKUP_ARGS} ${SOURCE_PATH}
end=$(date +%s)

logger -p user.info "Backup completed in $(expr ${end} - ${start}) seconds."

start=$(date +%s)
runny /usr/local/bin/restic forget ${RESTIC_FORGET_ARGS} --prune
end=$(date +%s)

logger -p user.info "Backup pruning completed in $(expr ${end} - ${start}) seconds."

start=$(date +%s)
runny /usr/local/bin/restic check
end=$(date +%s)

logger -p user.info "Repository check completed in $(expr ${end} - ${start}) seconds."

logger -p user.info "...completed backup."
