# Alma info screen
Opens and refreshes web pages automatically on local or remote devices.
Uses Chrome and crontab as refresh timer (default 1 minute).

# Usage (Works only on OSX)
Local setup:

`./setup.sh https://example.com https://example2.com`

Remote setup:

`TARGET=128.128.128.128 USER=exampleuser ./setup.sh https://example.com https://example2.com`

Set or disable timer:

`TIMER=10 ./setup.sh https://example.com https://example2.com`

`TIMER=0 ./setup.sh https://example.com https://example2.com`
