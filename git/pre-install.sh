#!/usr/bin/env bash

mac () {
  brew install git
  brew install tig
  setup
}

ubuntu () {
  sudo apt-get install git -y
  sudo apt install tig -y
  setup
}

setup () {
  if [[ -L "$HOME/.gitconfig" ]] ; then
    return
  fi

  prompt_yes_no "[git] setup?"
  if [[ $? -eq 1 ]] ; then
    return 1
  fi

  read -r -p "[git] Enter your name: "  name < /dev/tty
  read -r -p "[git] Enter your email: " email < /dev/tty
  read -r -p "[git] Enter your GitHub personal token: " github_api_token < /dev/tty

  github_ssl_key_name="$(hostname)_$(date +%d-%m-%Y)"

  if ! [[ -e "${HOME}/.ssh/id_rsa" ]] ; then
    ssh-keygen -f "${HOME}/.ssh/id_rsa" -t rsa -b 4096 -C "${email}" -N ''
  fi
  eval "$(ssh-agent -s)"
  ssh-add "$HOME/.ssh/id_rsa"
  ssl_public_key="$(tail -1 < "${HOME}"/.ssh/id_rsa.pub)"

  curl -H "Authorization: token ${github_api_token}" \
    -H "Content-Type: application/json" \
    -X POST -d "{\"title\":\"${github_ssl_key_name}\",\"key\":\"${ssl_public_key}\"}" \
    https://api.github.com/user/keys

  sed \
    -e "s/__AUTHORNAME__/$name/g" \
    -e "s/__AUTHOREMAIL__/$email/g" \
    "git/_gitconfig" > "$DOTFILES_DIR/gitconfig"

  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# git
export EDITOR=vim
EOT
}

os_call "[git] install?" mac ubuntu
