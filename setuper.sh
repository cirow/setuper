#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
PARENT_PATH="$(dirname "$(readlink -f "$0")")"


case "$1" in
    dbeaver) "${PARENT_PATH}/functions/dbeaver/install.sh"
    ;;
    postman) "${PARENT_PATH}/functions/postman/install.sh"
    ;;
    haroopad) "${PARENT_PATH}/functions/haroopad/install.sh"
    ;;
    help) cat "${PARENT_PATH}/functions/help"
    ;;
    *) echo "Argument ${1} not recognized, try setuper help for instructions"
    ;;
esac