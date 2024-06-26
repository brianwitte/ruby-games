#!/usr/bin/env bash

url="https://zoom.us/client/6.1.0.198/zoom_amd64.deb"

file_path="/tmp/zoom_amd64.deb"

echo "Downloading Zoom..."
curl -L $url -o $file_path

if [ -f $file_path ]; then
    echo "Download successful. Installing Zoom..."

    # Install Discord using dpkg
    sudo dpkg -i $file_path

    # Fix any missing dependencies that dpkg might not handle
    sudo apt-get install -f

    echo "Zoom installation completed successfully."
else
    echo "Failed to download the file. Please check the URL and your internet connection."
fi
