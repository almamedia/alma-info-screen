# Info screen
Opens and refreshes web pages automatically on local or remote devices (OSX).

By default the pages are shown side-by-side and refreshed once per minute.

Can be setup to rotate urls in full-screen.

Every one hour Chrome is rebooted.

Ask Tero Virolainen for list of IP-addresses for the info-screen machines.
Use Screen Sharing or SSH to connect to them.

# Requirements
## Remote machine:
* Install Google Chrome
* Setup SSH
* (Optional) Install Ublock origin

## Local:
* Install git (should be included in OSX)
* Clone repo: `git clone https://github.com/almamedia/alma-info-screen.git && cd alma-info-screen`
* If already cloned, pull the latest changes: `git pull`

# Setup
## Split screen
To install split screen run the following script (1-4 pages as parameters):

`./setup.sh https://example.com https://example2.com`

The pages should pop up and start refreshing automatically.
If the pages are not aligned correctly just drag them to the correct places.

Use TIMER variable to set the refresh interval in minutes, if set to zero then no refresh is used.

Default timer for split screen is one minute.

`TIMER=2 ./setup.sh https://example.com https://example2.com`

## Tab rotate
To install tab rotate run the following script (2-20 pages as parameters):

`TYPE=ROTATE ./setup.sh https://example.com https://example2.com https://example3.com https://example4.com`

The first page should open in full-screen, and urls should start rotating in one minute with 5s interval.

If TIMER is used with **TYPE=ROTATE**, it specifies seconds, not minutes.

Default timer for tab rotate is 5 seconds.

`TIMER=30 TYPE=ROTATE ./setup.sh https://example.com https://example2.com https://example3.com https://example4.com`

## Remote setup

Scripts can be run on a remote machine, by prepending the TARGET and USER environment variables before the script:

`TARGET=128.128.128.128 USER=exampleuser ./setup.sh https://example.com https://example2.com`

`TARGET=128.128.128.128 USER=exampleuser TIMER=0 ./setup.sh https://example.com https://example2.com`

# After setup:
* Accept cookies
* Block any annoying elements on the page (right click -> block this element)
* Set page size with CMD + or CMD - on the browser

# Uninstall

`./uninstall.sh`

or

`TARGET=128.128.128.128 USER=exampleuser ./uninstall.sh`
