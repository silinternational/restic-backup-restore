#!/usr/bin/env sh

logger -p user.info "Restoring ${RESTIC_RESTORE_ID}..."

start=$(date +%s)
runny /usr/local/bin/restic restore ${RESTIC_RESTORE_ID} --host ${RESTIC_HOST} --tag ${RESTIC_TAG} --target ${TARGET_PATH}
end=$(date +%s)

logger -p user.info "Restoration completed in $(expr ${end} - ${start}) seconds."
