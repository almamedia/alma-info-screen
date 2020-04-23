#!/usr/bin/env osascript

set timer to system attribute "TIMER"

if timer is "" then
    set timer to 5
else
		set loopLength to 60 / timer
end if

set loopLength to 60 / timer
set i to 1
tell application "Google Chrome"
	set i to active tab index of first window
	set i to i + 1
	set listSize to the number of tabs of first window

	if i > listSize then
		set i to 1
	end if
	repeat loopLength times
		try
			set listSize to the number of tabs of first window
			set active tab index of first window to i
			set i to i + 1
			if i > listSize then
				set i to 1
			end if
			reload tab i of first window
			delay timer
		end try
	end repeat
end tell
