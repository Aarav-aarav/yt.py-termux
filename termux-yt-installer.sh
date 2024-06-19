pkg install wget
pkg update && pkg upgrade -y
apt install curl
#!/bin/bash

# Install necessary packages
pkg install wget -y
pkg update && pkg upgrade -y
apt install curl -y

# Function to check if file exists
file_exists() {
    [ -f "$1" ]
}

# URL for install.sh script
install_script_url="https://download1073.mediafire.com/vnomtukef2rg7BZA5SMRARtL9BX_XZM_LYRkYKyGRWWBkZ_O8vc32hxNU9fx3pzOnzqlQa4A7wD41_JYKVMI-f1PJ1esthiooTAgVhxam8gQg1UKoTmwlnWeZIFGNX_3sG-LHKvjPF5Z6AXzpc7wQ-Xwt85V8E22XNOVfq8JXCtR-gph/9c52tfq8r5yn8zj/install.sh"

# Download install.sh script
echo "Downloading install.sh script..."
if wget -O install.sh "$install_script_url"; then
    echo "Download successful."
else
    echo "Download failed. Trying with curl..."
    if curl -o install.sh "$install_script_url"; then
        echo "Download successful with curl."
    else
        echo "Download failed. Exiting..."
        exit 1
    fi
fi

# Run the install.sh script
echo "Running install.sh script..."
chmod +x install.sh
./install.sh