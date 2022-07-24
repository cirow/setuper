#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="/home/${SUDO_USER}/.cache/setuper"
GOLANG_VERSION="go1.18.4.linux-amd64.tar.gz"

wget "https://go.dev/dl/${GOLANG_VERSION}"
rm -rf /usr/local/go && tar -C /usr/local -xzf "${GOLANG_VERSION}"
[[ -f "/home/${SUDO_USER}/.profile" ]] || (echo "export PATH=\$PATH:/usr/local/go/bin" > "/home/${SUDO_USER}/.profile")
[[ -f "/home/${SUDO_USER}/.profile" ]] && echo "/home/${SUDO_USER}//.profile found"

echo "Checking for the line at /home/${SUDO_USER}/.profile"
grep -q "export PATH=\$PATH:/usr/local/go/bin" "/home/${SUDO_USER}//.profile" || (echo "Did not find the line" && echo "export PATH=\$PATH:/usr/local/go/bin" >> "/home/${SUDO_USER}/.profile")
