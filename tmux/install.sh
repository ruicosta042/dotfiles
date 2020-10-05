#!/usr/bin/env bash

mac () {
  brew install tmux
  brew install reattach-to-user-namespace
  brew install tmuxinator
  setup
}

ubuntu () {
  sudo apt-get install tmux -y
  sudo apt-get install tmuxinator -y
  setup
}

setup () {
  # tmux tab completion
  curl -o tmux/_tmux-completion https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux
  cp vim/_tmux-completion "$HOME/.dotfiles/tmux-completion"
  cat << EOT >> "$DOTFILES_DIR/bash"

# tmux completion
source $DOTFILES_DIR/tmux-completion
EOT

  # tmuxinator default project
  mkdir "$HOME/.config/.tmuxinator"
  cp tmux/_tmuxinator-default.yml "$HOME/.config/.tmuxinator/default.yml"
}

os_call "[tmux] install?" mac ubuntu
