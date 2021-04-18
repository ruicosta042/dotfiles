#!/usr/bin/env bash

# https://stackoverflow.com/a/44549662
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s "$(which zsh)"

if [[ $(os_name) == "macos" ]] ; then
  zsh_rc_dir=macos
elif [[ $(os_name) == "ubuntu" ]] ; then
  zsh_rc_dir=ubuntu
fi


cp config/zsh/.dir_colors "$zsh_rc_dir"/.dir_colors
cp config/zsh/.inputrc "$zsh_rc_dir"/.inputrc
cp config/zsh/.zshrc "$zsh_rc_dir"/.zshrc

