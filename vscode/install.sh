#!/usr/bin/env bash

mac () {
  brew cask install visual-studio-code
  brew install shellcheck
  setup ~/Library/Application\ Support/Code/User/settings.json
  cp vscode/_keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json 

  # vscode-vim suggested configs
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
}

ubuntu () {
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
  sudo apt-get update -y

  sudo apt-get install code -y
  sudo apt-get install shellcheck -y
  setup ~/.config/Code/User/settings.json
  cp vscode/_keybindings.json ~/.config/Code/User/keybindings.json 
}

setup () {
  # extensions
  code --install-extension arcticicestudio.nord-visual-studio-code
  code --install-extension christian-kohler.npm-intellisense
  code --install-extension christian-kohler.path-intellisense
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension EditorConfig.EditorConfig
  code --install-extension esbenp.prettier-vscode
  code --install-extension fabiospampinato.vscode-todo-plus
  code --install-extension formulahendry.auto-rename-tag
  code --install-extension jpoissonnier.vscode-styled-components
  code --install-extension kumar-harsh.graphql-for-vscode
  code --install-extension mhutchie.git-graph
  code --install-extension mikestead.dotenv
  code --install-extension mkxml.vscode-filesize
  code --install-extension qinjia.seti-icons
  code --install-extension rsbondi.highlight-words
  code --install-extension shd101wyy.markdown-preview-enhanced
  code --install-extension SirTori.indenticator
  code --install-extension thibaudcolas.stylelint
  code --install-extension timonwong.shellcheck
  code --install-extension Tyriar.sort-lines
  code --install-extension vscodevim.vim
  code --install-extension WakaTime.vscode-wakatime
  code --install-extension wix.vscode-import-cost
  code --install-extension xabikos.JavaScriptSnippets

  # settings.json
  if [[ -e $1 ]] ; then
    rm "$1"
  fi
  sed \
    -e "s|__SHELLCHECK_EXECUTABLE_PATH__|$(command -v shellcheck)|g" \
    -e "s|__GIT_EXECUTABLE_PATH__|$(command -v git)|g" \
    -e "s|__INTEGRATED_SHELL_OSX_PATH__|$(command -v bash)|g" \
    vscode/_settings.json > "$1"

  # wakatime configuration
  read -r -p "[vscode] Enter your WakaTime API key: " wakatime_api_key < /dev/tty
  sed \
    -e "s|__WAKATIME_API_KEY__|$wakatime_api_key|g" \
    "vscode/_wakatime.cfg" > "$DOTFILES_DIR/wakatime.cfg"
}

os_call "[vscode] install?" mac ubuntu
