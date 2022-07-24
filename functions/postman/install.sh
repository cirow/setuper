#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="/home/${SUDO_USER}/.cache/setuper"

echo "Downloading https://dl.pstmn.io/download/latest"
wget -O "${PARENT_PATH}/postman-linux.tar.gz" https://dl.pstmn.io/download/latest/linux64
echo "Extracting file."
tar -xvf "${PARENT_PATH}/postman-linux.tar.gz" -C "${PARENT_PATH}"

echo "Moving to /opt/Postman"
if [ -d "/opt/Postman" ]; then
   mv /opt/Postman /opt/_Postman;
fi
mv "${PARENT_PATH}/Postman" /opt/Postman
rm -rf /opt/_Postman
rm -f postman-linux.tar.gz

echo "Creating Symlink at /usr/bin/postman"
ln -sfn /opt/Postman/Postman /usr/bin/postman
ls -la /usr/bin/postman

echo "Creating laucnher shortcut at:"
echo "/home/$SUDO_USER/".local/share/applications/
cp "${PARENT_PATH}/postman.desktop" "/home/${SUDO_USER}/.local/share/applications/"
sudo chown "${SUDO_USER}":"${SUDO_USER}" "/home/${SUDO_USER}/.local/share/applications/postman.desktop"
sudo rm -f "${PARENT_PATH}/postman-linux.tar.gz"
