#!/usr/bin/env bash

mac () {
  brew install git
  brew install bash-completion    # git completion
  brew install bash-git-prompt    # git prompt    
  setup

 cat << EOT >> "$DOTFILES_DIR/bash_profile"

# git completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] \
  && source "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# git prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# prompt
GIT_PROMPT_THEME=Custom
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
EOT

}

ubuntu () {
  sudo apt-get install git -y
  sudo apt-get install bash-completion -y   # git completion
  sudo apt-get install bash-git-prompt -y   # git prompt    
  setup

  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
EOT

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
    -e "s/__GIT_USERNAME__/$name/g" \
    -e "s/__GIT_EMAIL__/$email/g" \
    "git/_gitconfig" > "$DOTFILES_DIR/gitconfig"

  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# git
export EDITOR=vim
EOT
}

os_call "[git] install?" mac ubuntu
