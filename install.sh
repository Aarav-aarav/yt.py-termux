apt update
apt upgrade
apt install python
apt install python-pip
apt install vlc
pip install pytube3
apt install curl
pip install yt-dlp
apt install mpv
pip install youtube-search-python
pip install --upgrade pytube
pip install youtube-search-python
#!/bin/bash

# Function to check if file exists
file_exists() {
    [ -f "$1" ]
}

# URL to download the Python script
DOWNLOAD_URL="https://download948.mediafire.com/n49votvoabjgXLDkNrhNS4W2HeDHWpuAmw8A4VNTPgfeeMBARz4VI0OIDjn2kqKE4oVX6u1EyyIotZu4T5olAduIdZTkpAZqc5itT6qZ3jsXfkocloeN5GjpnCAjljYLsxl3YNHibZ1x6Ni7ttEG-0aTEL5Dhs2V6SWt6DWlfyetRUyT/gc81rjz0kgg4can/yt.py"

# Check if yt.py exists
if file_exists "yt.py"; then
    echo "yt.py found. Continuing..."
else
    echo "yt.py not found. Attempting to download..."

    # Attempt to download using wget
    if wget -O yt.py "$DOWNLOAD_URL"; then
        echo "Download via wget successful."
    else
        echo "Download via wget failed. Trying with curl..."

        # Attempt to download using curl
        if curl -o yt.py "$DOWNLOAD_URL"; then
            echo "Download via curl successful."
        else
            echo "Download via curl failed. Exiting..."
            exit 1
        fi
    fi

    # Check again if yt.py exists
    if file_exists "yt.py"; then
        echo "yt.py downloaded successfully. Continuing..."
    else
        echo "yt.py not found after download attempts. Exiting..."
        exit 1
    fi
fi

# Set executable permissions
chmod +x yt.py

# Clear screen
clear

# Display messages
echo "To run Termux YT, use: python3 yt.py"
sleep 10
clear
echo "Starting Termux YouTube."
sleep 1
clear
echo "Starting Termux YouTube.."
sleep 1
clear
echo "Starting Termux YouTube..."
sleep 1
clear
echo "Termux YT started for the first time."
sleep 1

# Run the Python script
python3 yt.py
