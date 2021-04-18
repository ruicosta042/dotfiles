#!/usr/bin/env bash

# https://stackoverflow.com/a/44549662
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s "$(which zsh)"

for source in $(find zsh/* -type f | sort -n) ; do
  filename="$(basename "${source%.*}")"

  if [[ $(os_name) == "macos" ]] ; then
    zsh_rc_dir=macos
  elif [[ $(os_name) == "ubuntu" ]] ; then
    zsh_rc_dir=ubuntu
  fi

  target="$zsh_rc_dir/${filename}"
  cp "$source" "$target"
done