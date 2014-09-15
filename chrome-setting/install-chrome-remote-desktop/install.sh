#!/bin/bash
sudo dpkg -i chrome-remote-desktop_current_amd64.deb
sudo apt-get install -f
sudo echo "export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1024x768" >> ~/.profile
