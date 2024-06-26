#!/usr/bin/env bash

url="https://discord.com/api/download?platform=linux&format=deb"

file_path="/tmp/discord.deb"

echo "Downloading Discord..."
curl -L $url -o $file_path

if [ -f $file_path ]; then
    echo "Download successful. Installing Discord..."

    # Install Discord using dpkg
    sudo dpkg -i $file_path

    # Fix any missing dependencies that dpkg might not handle
    sudo apt-get install -f

    echo "Discord installation completed successfully."
else
    echo "Failed to download the file. Please check the URL and your internet connection."
fi
