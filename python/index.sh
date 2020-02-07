#!/usr/bin/env bash

mac() {
  brew install python
  pip install --user pipenv

  cat << EOT >> "$DOTFILES_DIR/bash_profile"

# Python: use Python3 by default
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# add user installation directory to PATH
export PATH="$(python -m site --user-base)/bin:$PATH"
EOT
}

os_call "[python] install?" mac 
