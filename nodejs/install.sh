#!/usr/bin/env bash

update_bash_profile () {
  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# nodejs: allow calling local packages' binaries without prefix
export PATH=\$PATH:./node_modules/.bin
EOT
}

mac () {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  nvm install node
  update_bash_profile
}

ubuntu () {
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  nvm install node
  update_bash_profile
}

os_call "[nodejs] install?" mac ubuntu
