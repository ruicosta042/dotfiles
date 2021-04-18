#!/usr/bin/env bash

# fzf
"$(brew --prefix)"/opt/fzf/install --all

# git
source 'config/git/install.sh'

# hosts
git clone https://github.com/StevenBlack/hosts "hosts/hosts"
cd "hosts/hosts" || return 1;
pip3 install --user -r requirements.txt
python3 updateHostsFile.py --auto --replace --backup --flush-dns-cache --compress
cd ../..
rm -rf hosts/hosts

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall


# vscode
source 'config/vscode/install.sh'


if test "$(uname)" = "Darwin" ; then
  # chromium
  # so that the firewall doesn't ask to block incoming connections
  codesign --force --deep --sign - /Applications/Chromium.app/Contents/MacOS/Chromium


  # iterm2
  defaults write com.googlecode.iterm2 "Default Bookmark Guid" 04902148-e89d-4ca2-818d-dae26d7aa557
  defaults write com.googlecode.iterm2 PromptOnQuit 0;
  defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed 1;
  defaults write com.googlecode.iterm2 SUEnableAutomaticChecks 1;
  defaults write com.googlecode.iterm2 "Mouse Reporting" 1;
  # can't set the theme to minimal


  # rectangle
  defaults write com.knollsoft.Rectangle launchOnLogin -bool true
  defaults write com.knollsoft.Rectangle alternateDefaultShortcuts -bool true


  # wallpaper
  # set wallpaper to solid color from nord theme
  wallpaper set-solid-color 434c5e


fi