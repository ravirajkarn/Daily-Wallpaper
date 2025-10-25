# Daily-Wallpaper
![Bing](https://img.shields.io/badge/Microsoft%20Bing-258FFA?style=for-the-badge&logo=Microsoft%20Bing&logoColor=white) ![linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black) ![shell](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Apple](https://img.shields.io/badge/Apple-%23000000.svg?style=for-the-badge&logo=apple&logoColor=white) ![Github-sponsors](https://img.shields.io/badge/sponsor-30363D?style=for-the-badge&logo=GitHub-Sponsors&logoColor=#EA4AAA) ![XFCE](https://img.shields.io/badge/XFCE-%232284F2.svg?style=for-the-badge&logo=xfce&logoColor=white)

## Description
I am on linux desktop. I want to set my home screen or lock screen wallpaper which change daily. Every it should me new wallpaper just like bing wallpaper/spotlight in windows.

## Feature 
- Download new wallpaper.
- Set the the wallpaper.

## How to use
Simply download the `daily_wallpaper.sh` file and run however you want.

or follow the steps.

-Step 1: Clone the repository
```bash
git clone https://github.com/ravirajkarn/Daily-Wallpaper.git
cd Daily-Wallpaper
```
You can run `daily_wallpaper.sh` manually or automate the process. 

-Step 2: Automate the process with cron. 
```bash
EDITOR=vim crontab -e
```
add this line
```vim 
# Runing the script to download the Bing Wallpaper Daly.
0 0 * * * /home/ravirajkarn/Public/BingWallpapers/bing_wallpaper.sh
```
This will download wallpaper daily.

-Step 3: you can use linux it's own background manager. 

![alt text](<Xfce Desktop Manager.png>)


OR 

uncomment this line
```bash
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/last-image -s "$WALLPAPER_FILE"
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor1/last-image -s "$WALLPAPER_FILE"
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image -s "$WALLPAPER_FILE"
```