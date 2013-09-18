#!/usr/bin/env bash
set -e
test -f ./common.sh || { curl -L -O https://raw.github.com/cookbase/my_scripts/master/common.sh; } && { source common.sh;}

check_for_git() {
  result=`which git`
  if [ "x${result}" = "x" ]; then
    ec="1"
  else
    ec="0"
  fi
  echo $ec
}

set_git_vars () {
 git_ver='1.8.3.2'
 git_vol="/Volumes/Git ${git_ver} Snow Leopard Intel Universal"
 git_dmg="git-${git_ver}-intel-universal-snow-leopard.dmg"
 git_dmg_url="https://www.dropbox.com/s/pjj271zppadvje7/$git_dmg"
 git_mpkg="git-${git_ver}-intel-universal-snow-leopard.pkg"
}

install_dmg() {
  pkg_name=$1
  dmg_loc=$2
  mpkg=$3
  mountpath="$4"
  mac_vol=${5:-'/Volumes/Macintosh HD'}
  
  echo -e "$info mounting $pkg_name"
  hdiutil mount -nobrowse ./$pkg_name
  installer -pkg "$mountpath/$mpkg" -target "$mac_vol"
  hdiutil unmount "$mountpath"

}

main () {

  check_root

  if [[ `check_for_git` -ne 0 ]]; then
    set_git_vars
    echo "$info installing git, version: $git_ver"
    pushd /tmp
    curl -L -O $git_dmg_url 
    # install the damn thing ...
    install_dmg "$git_dmg" "$git_pkg" "$git_mpkg" "$git_vol"      
    test -f '/usr/local/git/bin/git' && echo git binary found at "/usr/local/git/bin/git"
    export PATH=$PATH:/usr/local/git/bin/
    popd
  else
    echo "$info git already installed"
  fi

  # Check local conifg - annoying to see commit on git hub with user@localhost ...
  (git config --get user.email &>/dev/null || git config --get user.name &>/dev/null ) || \
  (echo -e "$warning Git config seems empty I would do the following:" 
   echo -e "\t git config --global user.name \"Your username\"" 
   echo -e "\t git config --global user.email youremail@exmaple.com \n")
}

main
