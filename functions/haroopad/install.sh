#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="$(dirname "$(readlink -f "$0")")"


wget -O "${PARENT_PATH}/haroopad.deb" https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.13.1-x64.deb;
dpkg -i "${PARENT_PATH}/haroopad.deb";
apt-get install -f;
rm -f "${PARENT_PATH}/haroopad.deb";
