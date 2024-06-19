download the file that is in the releases tab
after doing that in termux do
mv /sdcard/download/termux-yt-installer.sh /$HOME
chmod +x termux-yt-installer.sh
./termux-yt-installer.sh
at the end after doing that to begin the real installation process do
sh install.sh
which should install it after installing to run it do
python3 yt.py
or make a file named .sh and the contents of that file should be
python3 /$HOME/yt.py
save the file in mac format and now to start youtube do
sh .sh
or
chmod +x .sh
this command gives it executive properties this only needs to be run once now to start
./.sh
that's all
