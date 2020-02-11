#!/usr/bin/env sh

logger -p user.info "Started Restic repository initialization..."

start=$(date +%s)
runny /usr/local/bin/restic init
end=$(date +%s)

logger -p user.info "Repository initialization completed in $(expr ${end} - ${start}) seconds."

logger -p user.info "...completed repository initialization."
