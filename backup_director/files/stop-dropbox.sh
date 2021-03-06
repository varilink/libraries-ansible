#!/usr/bin/env bash

# Bacula helper script to stop the Dropbox daemon. This is run at the start of
# each backup job so that Dropbox is not attempting synchronisation while the
# job is writing to the Dropbox folder.

echo "Reporting Dropbox status at start of job:"
gosu bacula bash -c '~/dropbox.py status'

# Stop Dropbox
gosu bacula bash -c '~/dropbox.py stop'

# Pause for the command that we just issued to take effect
sleep 10

echo "Reporting Dropbox status after stop command issued:"
gosu bacula bash -c '~/dropbox.py status'

exit 0
