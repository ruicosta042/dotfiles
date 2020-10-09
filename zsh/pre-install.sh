#!/usr/bin/env bash

mac () {
  brew install zsh
  brew install antibody

  copy_rc_files

  # https://stackoverflow.com/a/44549662
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s "$(which zsh)"
}

ubuntu () {
  sudo apt-get install zsh -y

  copy_rc_files
}

copy_rc_files () {
  for source in $(find zsh/_* -type f | sort -n) ; do
    filename="$(basename "${source%.*}")"
    target="$DOTFILES_DIR/${filename:1}"
    cp "$source" "$target"
  done
}

os_call "[zsh] install?" mac ubuntu