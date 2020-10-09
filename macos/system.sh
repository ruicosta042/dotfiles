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
brew cask install homebrew/cask-fonts/font-hack

echo "[macos] command line utilities"
brew install dust   # better du -sh
brew install htop   # better top
brew install jq
brew install yank   # copy terminal output to clipboard 
brew install fzf    # fuzzy file finder
"$(brew --prefix)"/opt/fzf/install --all
brew install tldr   # community driven by example man pages
brew install z      # jump around directories
brew install wallpaper  # manage desktop wallpaper

# general utilities
brew cask install kap         # screen recording (gifs)

brew cask install rectangle   # window manager
defaults write com.knollsoft.Rectangle launchOnLogin -bool true
defaults write com.knollsoft.Rectangle alternateDefaultShortcuts -bool true

# set wallpaper to solid color from nord theme
wallpaper set-solid-color 434c5e