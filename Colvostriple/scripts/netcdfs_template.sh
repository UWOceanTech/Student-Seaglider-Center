#!/bin/bash  # Keep this

# This script grabs all of the netcdf files from the current mission and 
# downloads them to your local machine.

SSH_USER="username"       # Replace with your SSH username
SSH_HOST="seaglider.pub" # Keep this
REMOTE_DIR="/home/jails/uwssc/gliderjail/home/sg195/current" # This is the current remote directory containing .nc files (tropical mission) 
LOCAL_DIR="/Path/to/your/directory"   # Replace with the directory where files will be saved on your local machine!

# Create the local directory if it doesn't exist
mkdir -p "$LOCAL_DIR"

# Use SSH to list .nc files in the remote directory and download them
echo "Connecting to $SSH_HOST to download .nc files from $REMOTE_DIR..."
scp "$SSH_USER@$SSH_HOST:$REMOTE_DIR/*.nc" "$LOCAL_DIR"

if [ $? -eq 0 ]; then
    echo "All .nc files have been successfully downloaded to $LOCAL_DIR."
else
    echo "Error occurred during file transfer."
fi

