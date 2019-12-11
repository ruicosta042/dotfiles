#!/usr/bin/env bash

mac_nvm () {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  setup_nvm
}

ubuntu_nvm () {
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  setup_nvm
}

setup_nvm () {
  # add nvm to startup apps
  cat << EOT >> "bash/bash_start"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \\. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \\. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOT

  # load nvm without exiting this shell
  export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

mac () {
  mac_nvm
  setup
}

ubuntu () {
  ubuntu_nvm
  setup
}

setup () {
  source "$HOME/.nvm/nvm.sh"
  nvm install node

  # allow calling local packages' binaries without prefix
  cat << EOT >> "bash/bash_profile"

# Node.js: allow calling local packages' binaries without prefix
export PATH=\$PATH:./node_modules/.bin
EOT
}

os_call "[nodejs] install?" mac ubuntu
