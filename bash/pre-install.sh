#!/usr/bin/env bash

mac () {
  brew install bash

  copy_rc_files

  # set new bash as default
  bash_bin="/usr/local/bin/bash"
  echo $bash_bin | sudo tee -a /etc/shells
  sudo chsh -s $bash_bin

cat << EOT >> "$DOTFILES_DIR/bash_profile"

# z - jump around directories
. /usr/local/etc/profile.d/z.sh
EOT

}

ubuntu () {
  sudo apt-get install bash -y
  sudo apt-get install bash-completion -y   # git completion
  sudo apt-get install bash-git-prompt -y        # git prompt    

  copy_rc_files

  # add bash completion
  cat << EOT >> "$DOTFILES_DIR/bash_profile"


# z jump around directories
. ${DOTFILES_DIR}/z.sh
EOT
}

copy_rc_files () {
  for source in $(find bash/_* -type f | sort -n) ; do
    filename="$(basename "${source%.*}")"
    target="$DOTFILES_DIR/${filename:1}"
    cp "$source" "$target"
  done
}

os_call "[bash] install?" mac ubuntu
