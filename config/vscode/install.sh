#!/usr/bin/env bash

prompt_yes_no "[vscode] setup?"
if [[ $? -eq 1 ]] ; then
  return 1
fi

# vscode-vim suggested configs
if [[ $(os_name) == "macos" ]] ; then
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
fi

# extensions
vscode_extensions=(
  arcticicestudio.nord-visual-studio-code
  ChakrounAnas.turbo-console-log
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  dbaeumer.vscode-eslint
  eamodio.gitlens
  EditorConfig.EditorConfig
  esbenp.prettier-vscode
  fabiospampinato.vscode-todo-plus
  formulahendry.auto-rename-tag
  jpoissonnier.vscode-styled-components
  kumar-harsh.graphql-for-vscode
  mhutchie.git-graph
  mikestead.dotenv
  mkxml.vscode-filesize
  qinjia.seti-icons
  rangav.vscode-thunder-client
  rsbondi.highlight-words
  shd101wyy.markdown-preview-enhanced
  SirTori.indenticator
  streetsidesoftware.code-spell-checker
  stylelint.vscode-stylelint
  timonwong.shellcheck
  Tyriar.sort-lines
  usernamehw.errorlens
  vscodevim.vim
  WakaTime.vscode-wakatime
  wix.vscode-import-cost
  xabikos.JavaScriptSnippets
)

for extension in "${vscode_extensions[@]}"; do
  code --install-extension "$extension" --force
done

# settings
if [[ $(os_name) == "macos" ]] ; then
  mkdir macos/Library/Application\ Support/Code
  mkdir macos/Library/Application\ Support/Code/User
  vscode_rc_dir=macos/Library/Application\ Support/Code/User
  wakatime_rc=macos/.wakatime.cfg
elif [[ $(os_name) == "ubuntu" ]] ; then
  mkdir ubuntu/.config
  mkdir ubuntu/.config/Code
  mkdir ubuntu/.config/Code/User
  vscode_rc_dir=ubuntu/.config/Code/User
  wakatime_rc=ubuntu/.wakatime.cfg
fi

vscode_rc="$vscode_rc_dir"/settings.json
keybindings_rc="$vscode_rc_dir"/keybindings.json

sed \
  -e "s|__SHELLCHECK_EXECUTABLE_PATH__|$(command -v shellcheck)|g" \
  -e "s|__GIT_EXECUTABLE_PATH__|$(command -v git)|g" \
  -e "s|__INTEGRATED_SHELL_OSX_PATH__|$(command -v bash)|g" \
  config/vscode/settings.template.json > "$vscode_rc"

cp config/vscode/keybindings.json "$keybindings_rc"

# wakatime configuration
read -r -p "[vscode] Enter your WakaTime API key: " wakatime_api_key < /dev/tty
sed \
  -e "s|__WAKATIME_API_KEY__|$wakatime_api_key|g" \
  "config/vscode/wakatime.template.cfg" > "$wakatime_rc"
