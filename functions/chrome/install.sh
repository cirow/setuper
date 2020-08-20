#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="$(dirname "$(readlink -f "$0")")"

wget -O "${PARENT_PATH}/chromium_amd64.deb" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
dpkg -i "${PARENT_PATH}/chromium_amd64.deb";
apt-get install -f;
rm -f "${PARENT_PATH}/chromium_amd64.deb";