# Info screen
Opens and refreshes web pages automatically on local or remote devices (OSX).

By default the pages are shown side-by-side and refreshed once per minute.

Every one hour Chrome is rebooted.

# Requirements
## Remote machine:
* Install Google Chrome
* Setup SSH
* (Optional) Install Ublock origin

## Local:
* Install git (should be included in OSX)
* Clone repo: `git clone git@github.com:almamedia/alma-info-screen.git && cd alma-info-screen`

# Setup
To install run the following script (1-4 pages as parameters):

`./setup.sh https://example.com https://example2.com`

The pages should pop up and start refreshing automatically.
If the pages are not aligned correctly just drag them to the correct places.

## Remote setup

Scripts can be run on a remote machine, by prepending the TARGET and USER environment variables before the script:

`TARGET=128.128.128.128 USER=exampleuser ./setup.sh https://example.com https://example2.com`


## Timer
Use TIMER variable to set the refresh interval in minutes, if set to zero then no refresh is used:

`TIMER=10 ./setup.sh https://example.com https://example2.com`

`TARGET=128.128.128.128 USER=exampleuser TIMER=0 ./setup.sh https://example.com https://example2.com`

# After setup:
* Accept cookies
* Block any annoying elements on the page (right click -> block this element)

# Uninstall

`./uninstall.sh`

or

`TARGET=128.128.128.128 USER=exampleuser ./uninstall.sh`
