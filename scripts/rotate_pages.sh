#!/usr/bin/env osascript

set listSize to system attribute "LENGTH"
set i to 1

tell application "Google Chrome"
	repeat 100 times
		try
			set active tab index of first window to i
      reload active tab of first window
			set i to i + 1
      if i > listSize
        set i to 1
      end if
			delay 10
		end try
	end repeat
end tell
