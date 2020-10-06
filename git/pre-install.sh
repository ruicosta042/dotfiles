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

  git_aliases

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

  git_aliases

}

git_aliases () {
  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# git aliases
alias g='git'
__git_complete g _git
alias gad='git add'
__git_complete gag _git
alias gbr='git branch'
__git_complete gbr _git_branch
alias gbrd='git branch --delete'
__git_complete gbrd _git_branch
alias gbrD='git branch --delete --force'
__git_complete gbrD _git_branch
alias gbrr='git branch --remotes'
__git_complete gbrr _git
alias gcm='git commit --verbose'
__git_complete gcm _git
alias gcmm='git commit --verbose --message'
__git_complete gcmm _git
alias gcma='git commit --amend'
__git_complete gcma _git
alias gcman='git commit --amend --no-edit'
__git_complete gcman _git
alias gch='git checkout'
__git_complete gch _git_checkout
alias gchb='git checkout -b'
__git_complete gchb _git_checkout
alias gcp='git cherry-pick'
__git_complete gcp _git
alias gcpa='git cherry-pick --abort'
__git_complete gcpa _git
alias gcpc='git cherry-pick --continue'
__git_complete gcpc _git
alias gfe='git fetch'
__git_complete gfe _git
alias gpl='git pull'
__git_complete gpl _git_pull
alias gplr='git pull --rebase'
__git_complete gplr _git_pull
alias gps='git push'
__git_complete gps _git_push
alias gpsf='git push --force-with-lease'
__git_complete gpsf _git_push
alias gpsu='git push -u'
__git_complete gpsu _git_push
alias grb='git rebase'
__git_complete grb _git_rebase
alias grba='git rebase --abort'
__git_complete grba _git_rebase
alias grbc='git rebase --continue'
__git_complete grbc _git_rebase
alias grbi='git rebase --interactive'
__git_complete grbi _git_rebase
alias grs='git reset'
__git_complete grs _git_reset
alias gsh='git stash'
__git_complete gsh _git_stash
alias gshc='git stash clear'
__git_complete gshc _git_stash
alias gshl='git stash list'
__git_complete gshl _git_stash
alias gshp='git stash pop'
__git_complete gshp _git_stash
alias gst='git status --short --branch'
__git_complete gst _git_status

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
