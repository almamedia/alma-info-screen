#!/bin/bash

# Uninstall cron and files
echo "Uninstalling..."
echo "" >> tmp_cron

crontab tmp_cron
rm tmp_cron
rm -r "${INSTALL_PATH}"

osascript -e '
  tell application "Google Chrome" to quit
'

echo "Success!"
