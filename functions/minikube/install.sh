#!/bin/bash
WARN='\033[1;33m';
NORMAL='\033[0m';
SUCCESS='\033[0;32m'
PARENT_PATH="$(dirname "$(readlink -f "$0")")"


curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64;
chmod +x minikube;
sudo install minikube /usr/local/bin/;
sudo rm -f minikube;
minikube version
if [ "${?}" -eq 0 ]; then
  echo -e "${SUCCESS}Minikube was installed successfuly${NORMAL}"
fi