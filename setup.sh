#!/bin/bash

# Install browser refresh scripts for the provided urls

# Install location
INSTALL_PATH="/Users/${USER}/alma-info-screen"
# Pages to open, only one is required
PAGE1=$1 PAGE2=$2 PAGE3=$3 PAGE4=$4

echo "Installing: Timer: ${TIMER}, to path: ${INSTALL_PATH}, Target: ${TARGET}, pages: ${PAGE1} ${PAGE2} ${PAGE3} ${PAGE4}"
# If no target is set, install locally
if [ -z "$TARGET" ]; then
  cp -r ./scripts "${INSTALL_PATH}"
  INSTALL_PATH=$INSTALL_PATH TIMER=$TIMER TYPE=$TYPE PAGE1=$PAGE1 PAGE2=$PAGE2 PAGE3=$PAGE3 PAGE4=$PAGE4 ./scripts/cron_install.sh
else
  scp -r ./scripts "${USER}@${TARGET}:${INSTALL_PATH}"
  ssh "${USER}@${TARGET}" INSTALL_PATH=$INSTALL_PATH TIMER=$TIMER TYPE=$TYPE PAGE1=$PAGE1 PAGE2=$PAGE2 PAGE3=$PAGE3 PAGE4=$PAGE4 'bash -s' < ./scripts/cron_install.sh
fi
