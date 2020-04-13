#!/usr/bin/env bash

install_node () {
  nodenv install 13.12.0
  nodenv global 13.12.0
}

update_bash_profile () {
  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# nodejs: allow calling local packages' binaries without prefix
export PATH=\$PATH:./node_modules/.bin
# Add nodenv init to your shell to enable shims and autocompletion.
eval "$(nodenv init -)"
EOT
}

mac () {
  brew install nodenv

  update_bash_profile
  eval "$(nodenv init -)"
  install_node
}

ubuntu () {
  # https://gist.github.com/fraserxu/23c2704cffa5a4cde79e1a48c087eca4
  NODENV_ROOT="$HOME/.nodenv"
  # checkout code from github
  git clone https://github.com/nodenv/nodenv.git "$NODENV_ROOT"
  git clone https://github.com/nodenv/node-build.git "$NODENV_ROOT"/plugins/node-build
  # compile dynamic bash extension
  cd "$NODENV_ROOT" && src/configure && make -C src

  update_bash_profile
  eval "$(nodenv init -)"
  install_node
}

os_call "[nodejs] install?" mac ubuntu
