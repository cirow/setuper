#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="/home/${SUDO_USER}/.cache/setuper"
GOLANG_VERSION="go1.18.4.linux-amd64.tar.gz"

wget "https://go.dev/dl/${GOLANG_VERSION}"
rm -rf /usr/local/go && tar -C /usr/local -xzf "${GOLANG_VERSION}"
[[ -f "${HOME}/.profile" ]] || echo "export PATH=\$PATH:/usr/local/go/bin" > "${HOME}/.profile"
grep -q "export PATH=\$PATH:/usr/local/go/bin" "${HOME}/.profile" || echo "export PATH=\$PATH:/usr/local/go/bin" >> "${HOME}/.profile"
