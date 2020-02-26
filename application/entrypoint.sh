#!/usr/bin/env sh

if [ "${LOGENTRIES_KEY}" ]; then
    sed -i /etc/rsyslog.conf -e "s/LOGENTRIESKEY/${LOGENTRIES_KEY}/"
    rsyslogd
    sleep 10 # ensure rsyslogd is running before we may need to send logs to it
else
    logger -p user.error  "Missing LOGENTRIES_KEY environment variable"
fi

# default to every day at 2 am when no schedule is provided
#dkn echo "${CRON_SCHEDULE:=0 2 * * *} runny /data/${FSBACKUP_MODE}.sh" >> /etc/crontabs/root
echo "${CRON_SCHEDULE:=0 2 * * *} /data/${FSBACKUP_MODE}.sh" >> /etc/crontabs/root

#dkn runny $1
output=$($1 2>&1)
rc=$?
message="$1: exited, Status: ${rc}, Output: ${output}"
logger -p 1 -t application.warn "${message}"
echo "${message}"
exit ${rc}
