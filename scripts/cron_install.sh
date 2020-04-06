#!/bin/bash

# Install browser refresh scripts for the provided urls

# Install cron to run the script
echo "@reboot sleep 120 && ${INSTALL_PATH}/open_pages.sh $PAGE1 $PAGE2 $PAGE3 $PAGE4 >/dev/null 2>&1" >> tmp_cron
echo "00 * * * * ${INSTALL_PATH}/open_pages.sh $PAGE1 $PAGE2 $PAGE3 $PAGE4 >/dev/null 2>&1" >> tmp_cron

# Use default timer if timer is not set
if [ -z "$TIMER" ]; then
  echo "* * * * * ${INSTALL_PATH}/refresh_pages.sh >/dev/null 2>&1" >> tmp_cron

# Add refresh timer if more than 0 minutes
elif (($TIMER > 0 )); then
  echo "*/${TIMER} * * * * ${INSTALL_PATH}/refresh_pages.sh >/dev/null 2>&1" >> tmp_cron
fi

# If timer is 0 then don't add refresh

crontab tmp_cron
rm tmp_cron

"${INSTALL_PATH}/open_pages.sh" $PAGE1 $PAGE2 $PAGE3 $PAGE4 &
echo "${TIMER} timer was setup to refresh pages: ${PAGE1} ${PAGE2} ${PAGE3} ${PAGE4}"
