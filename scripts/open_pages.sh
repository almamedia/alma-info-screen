#!/bin/bash

open_page () {
  URL=$1
  NUM_PAGES=$2
  INDEX=$3

  if [ $NUM_PAGES -eq 1 ]; then
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --app="${URL}" \
    --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars \
    --disable-features=TranslateUI --password-store=basic \
    --disable-breakpad \
    –-start-fullscreen \
    --kiosk &
    #--chrome-frame \
    #--window-size=$2 \
    #--window-position=$1 \
  else
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --app="data:text/html,<html><body><script>\
    window.moveTo(window.screen.availWidth - (window.screen.availWidth / ${NUM_PAGES}) * (${NUM_PAGES} - ${INDEX}), 0);
    window.resizeTo(window.screen.availWidth / ${NUM_PAGES}, window.screen.availHeight);
    window.location='${URL}';
    </script></body></html>" \
    --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars \
    --disable-features=TranslateUI --password-store=basic &
  fi
}


osascript -e '
  tell application "Google Chrome" to quit
'

# If rotate, open all pages at once
if [ -z "$TYPE" ]; then
  # Else load pages side by side
  NUM_PAGES=${#@}
  INDEX=0

  for URL in "$@"
  do
    open_page $URL $NUM_PAGES $INDEX
    ((INDEX++))
  done
else
  URLS="${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20}"
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  $URLS \
  --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars \
  --disable-features=TranslateUI --password-store=basic \
  --disable-breakpad --kiosk  >/dev/null 2>&1 &
  exit;
fi
