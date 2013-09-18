#!/usr/bin/env bash
set -e

export info="\033[0;32m==> info ]\033[0m"
export warning="\033[0;33m==> warn ]\033[0m"
export error="\033[0;31m==> error ]\033[0m"

check_root() {
  if [[ $EUID -ne 0 ]]; then
      echo -e "$error This script must be run as root\n$info You could also run: sudo $0" 1>&2
      exit 1
  fi
}

check_root
echo -e "$info Looking for Git ..., if absent will install it ..."
  sudo bash < <(curl -L https://raw.github.com/hagzag/my_scripts/master/install_git.sh)
echo -e "$info Looking for MAC OSX CLI TOOLS, if absent will install it ..."
  sudo bash < <(curl -L https://raw.github.com/hagzag/xcode-cli-install/master/install.sh)
