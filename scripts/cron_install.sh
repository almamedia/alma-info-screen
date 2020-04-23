#!/bin/bash

# Install browser refresh scripts for the provided urls

# Install cron to run the script
echo "TYPE=$TYPE @reboot sleep 120 && ${INSTALL_PATH}/open_pages.sh ${p1} ${p2} ${p3} ${p4} ${p5} ${p6} ${p7} ${p8} ${p9} ${p10} ${p11} ${p12} ${p13} ${p14} ${p15} ${p16} ${p17} ${p18} ${p19} ${p20}  >/dev/null 2>&1" >> tmp_cron
echo "TYPE=$TYPE 00 * * * * ${INSTALL_PATH}/open_pages.sh ${p1} ${p2} ${p3} ${p4} ${p5} ${p6} ${p7} ${p8} ${p9} ${p10} ${p11} ${p12} ${p13} ${p14} ${p15} ${p16} ${p17} ${p18} ${p19} ${p20} >/dev/null 2>&1" >> tmp_cron

if [ -z "$TYPE" ]; then
  # Use default timer if timer is not set
  if [ -z "$TIMER" ]; then
    echo "* * * * * ${INSTALL_PATH}/refresh_pages.sh >/dev/null 2>&1" >> tmp_cron

  # Add refresh timer if more than 0 minutes
  else
    echo "*/${TIMER} * * * * ${INSTALL_PATH}/refresh_pages.sh >/dev/null 2>&1" >> tmp_cron
  fi
else
  echo "TIMER=$TIMER * * * * * ${INSTALL_PATH}/rotate_pages.sh ${p1} ${p2} ${p3} ${p4} ${p5} ${p6} ${p7} ${p8} ${p9} ${p10} ${p11} ${p12} ${p13} ${p14} ${p15} ${p16} ${p17} ${p18} ${p19} ${p20} >/dev/null 2>&1" >> tmp_cron
fi



# If timer is 0 then don't add refresh

crontab tmp_cron
rm tmp_cron

TYPE=${TYPE} "${INSTALL_PATH}/open_pages.sh" ${p1} ${p2} ${p3} ${p4} ${p5} ${p6} ${p7} ${p8} ${p9} ${p10} ${p11} ${p12} ${p13} ${p14} ${p15} ${p16} ${p17} ${p18} ${p19} ${p20} &
echo "${TIMER} timer was setup to refresh pages: ${p1} ${p2} ${p3} ${p4} ${p5} ${p6} ${p7} ${p8} ${p9} ${p10} ${p11} ${p12} ${p13} ${p14} ${p15} ${p16} ${p17} ${p18} ${p19} ${p20}"
