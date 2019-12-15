#!/usr/bin/env bash

mac () {
  brew install vim

  setup
}

ubuntu () {
  sudo apt-get install vim -y

  setup
}

setup () {
  cp vim/_vimrc "$HOME/.dotfiles/vimrc"
  ln -sf "$HOME/.dotfiles/vimrc" "$HOME/.vimrc"

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  vim +PlugInstall +qall

  cat << EOT >> "$HOME/.dotfiles/vimrc"

colorscheme nord
EOT
}

os_call "[vim] install?" mac ubuntu
