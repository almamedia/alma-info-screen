# Info screen installer
Opens and refreshes web pages automatically on local or remote devices (OSX).

# Prequisites:
* Install Google Chrome
* Install ad-blocker

# Setup
To install run the following script (1-4 pages as parameters):

`./setup.sh https://example.com https://example2.com`

The pages should pop up and start refreshing automatically.

## Remote setup

Scripts can be run on a remote machine, by prepending the TARGET and USER environment variables before the script:

`TARGET=128.128.128.128 USER=exampleuser ./setup.sh https://example.com https://example2.com`


## Timer
Use TIMER variable to set the refresh interval in minutes, if set to zero then no refresh is used:

`TIMER=10 ./setup.sh https://example.com https://example2.com`

`TARGET=128.128.128.128 USER=exampleuser TIMER=0 ./setup.sh https://example.com https://example2.com`

# After setup:
* Accept cookies
* Block any annoying elements on the page

# Uninstall

`./uninstall.sh`

or

`TARGET=128.128.128.128 USER=exampleuser ./uninstall.sh`
