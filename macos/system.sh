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
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew install bat    # better cat (syntax highlighting)
brew install dust   # better du -sh
brew install htop   # better top
brew install jq
brew install yank   # copy terminal output to clipboard 
brew install fzf    # fuzzy file finder
"$(brew --prefix)"/opt/fzf/install --all

# general utilities
brew cask install spectacle   # window manager
brew cask install gifox       # screen recording (gifs)
