#!/bin/bash

# Uninstall cron and files

# Install location
INSTALL_PATH="/Users/${USER}/alma-info-screen-scripts"

# If no target is set, install locally
if [ -z "$TARGET" ]; then
  INSTALL_PATH=$INSTALL_PATH ./scripts/uninstall.sh
else
  ssh "${USER}@${TARGET}" INSTALL_PATH=$INSTALL_PATH 'bash -s' < ./scripts/uninstall.sh
fi
