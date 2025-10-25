#!/bin/bash

##############################################################################################################
# NETWORK CHECK

CHECK_HOST="www.bing.com"
CHECK_PORT=80
WAIT_TIME=7200 # Wait time in seconds between checks

echo "$(date): Checking for stable network connection..."

while true; do 
	# use netcat (nc) to check if the host is rechable on the spacified port
	if nc -zw 5 "$CHECK_HOST" "$CHECK_PORT" &>/dev/null; then
		echo "$(date): Network is stable. Proceeding with download."
		break # Exit the loop, network is up
	else
		echo "$(date): Network down or host unreachable. Waiting $WAIT_TIME seconds..."
		sleep "$WAIT_TIME" # Wait before checking again
	fi
done
#############################################################################################################


# uncomment this to change the file back to default
#WALLPAPER_DIR="/usr/share/backgrounds/kali-16x9/default"
WALLPAPER_DIR="$HOME/Public/BingWallpapers"
mkdir -p "$WALLPAPER_DIR"

# Get the Bing image metadata in JSON format for en-IN (India) market
# You can change 'mkt=en-IN' to your desired market like 'en-US', 'en-GB', etc.
# idx=0 means today's image, n=1 means one image.
BING_API_URL="https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-IN"

# Fetch JSON data
JSON_DATA=$(curl -s "$BING_API_URL")

# Extract the image URL using 'jq' (install if you don't have it: sudo apt install jq)
IMAGE_PATH=$(echo "$JSON_DATA" | jq -r '.images[0].url')

# Construct the full image URL
FULL_IMAGE_URL="https://www.bing.com${IMAGE_PATH}"

# Get today's date for the filename
TODAY_DATE=$(date +%Y-%m-%d)
WALLPAPER_FILE="$WALLPAPER_DIR/bing_wallpaper_${TODAY_DATE}.jpg"

# Download the image
wget -O "$WALLPAPER_FILE" "$FULL_IMAGE_URL"

# Set the new wallpaper using xfconf-query
# This path assumes a single monitor and single workspace.
# If you have multiple, you might need to adjust:
# xfconf-query -c xfce4-desktop -l -v to list properties.
#
# xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/last-image -s "$WALLPAPER_FILE"
# xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor1/last-image -s "$WALLPAPER_FILE"
# xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image -s "$WALLPAPER_FILE"

# Optional: Clean up old wallpapers (e.g., keep only the last 7)
find "$WALLPAPER_DIR" -type f -name "bing_wallpaper_*.jpg" -mtime +7 -delete
