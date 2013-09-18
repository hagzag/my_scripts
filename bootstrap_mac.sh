#!/usr/bin/env bash
set -e

test -f ./common.sh || { curl -L -O https://raw.github.com/cookbase/my_scripts/master/common.sh && source common.sh ; } && { source common.sh;}

check_root
echo -e "$info Looking for Git ..., if absent will install it ..."
  sudo bash < <(curl -L https://raw.github.com/hagzag/my_scripts/master/install_git.sh)
echo -e "$info Looking for MAC OSX CLI TOOLS, if absent will install it ..."
  sudo bash < <(curl -L https://raw.github.com/hagzag/xcode-cli-install/master/install.sh)

