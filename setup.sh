#!/bin/bash

# Install browser refresh scripts for the provided urls
git pull origin $(git rev-parse --abbrev-ref HEAD)

# Install location
INSTALL_PATH="/Users/${USER}/alma-info-screen-scripts"

# Pages to open, only one is required


echo "Installing: Timer: ${TIMER}, to path: ${INSTALL_PATH}, Target: ${TARGET}, pages: ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20}"
# If no target is set, install locally
if [ -z "$TARGET" ]; then
  INSTALL_PATH=$INSTALL_PATH ./scripts/uninstall.sh
  cp -r ./scripts "${INSTALL_PATH}"
  INSTALL_PATH=$INSTALL_PATH TIMER=$TIMER TYPE=$TYPE \
  p1=$1 p2=$2 p3=$3 p4=$4 p5=$5 p6=$6 p7=$7 p8=$8 p9=$9 p10=${10} p11=${11} p12=${12} p13=${13} p14=${14} p15=${15} p16=${16} p17=${17} p18=${18} p19=${19} p20=${20} \
  ./scripts/cron_install.sh
else
  ssh "${USER}@${TARGET}" INSTALL_PATH=$INSTALL_PATH 'bash -s' < ./scripts/uninstall.sh
  scp -r ./scripts "${USER}@${TARGET}:${INSTALL_PATH}"
  ssh "${USER}@${TARGET}" INSTALL_PATH=$INSTALL_PATH TIMER=$TIMER TYPE=$TYPE \
  p1=$1 p2=$2 p3=$3 p4=$4 p5=$5 p6=$6 p7=$7 p8=$8 p9=$9 p10=${10} p11=${11} p12=${12} p13=${13} p14=${14} p15=${15} p16=${16} p17=${17} p18=${18} p19=${19} p20=${20} \
  'bash -s' < ./scripts/cron_install.sh
fi
