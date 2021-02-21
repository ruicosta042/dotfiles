#!/usr/bin/env bash

# appstore
echo "[macos] appstore update"
sudo softwareupdate -i -a

#  xcode
echo "[macos] xcode"
xcode-select --install
sudo xcodebuild -license

# homebrew
echo "[macos] homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew install caskroom/cask/brew-cask 2> /dev/null
brew install coreutils
brew install gnu-sed
brew install grep
brew install moreutils

# Hack font
brew tap homebrew/cask-fonts
brew install font-hack

echo "[macos] command line utilities"
brew install htop   # better top
brew install jq
brew install fzf    # fuzzy file finder
"$(brew --prefix)"/opt/fzf/install --all
brew install z      # jump around directories
brew install wallpaper  # manage desktop wallpaper

# general utilities
brew install kap          # screen recording 
brew install runjs        # js/ts repl

brew install rectangle    # window manager
defaults write com.knollsoft.Rectangle launchOnLogin -bool true
defaults write com.knollsoft.Rectangle alternateDefaultShortcuts -bool true

# set wallpaper to solid color from nord theme
wallpaper set-solid-color 434c5e
