#!/usr/bin/env bash

install() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

  # load nvm without exiting this shell
  NVM_DIR="$(realpath ~/.nvm)"
  export NVM_DIR
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

  nvm install node

  # allow calling local packages' binaries without prefix
  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# Node.js: allow calling local packages' binaries without prefix
export PATH=\$PATH:./node_modules/.bin
EOT
}

mac () {
  install
}

ubuntu () {
  install
}

os_call "[nodejs] install?" mac ubuntu
