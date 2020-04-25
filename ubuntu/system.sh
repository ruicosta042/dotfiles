#!/usr/bin/env bash

echo "[ubuntu] system update"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

echo "[ubuntu] devtools"
sudo apt-get install curl -y
sudo apt-get install build-essential -y
sudo apt-get install libssl-dev -y
sudo apt-get install jq -y
sudo apt-get install apt-transport-https -y
sudo apt-get install ca-certificates -y
sudo apt-get install software-properties-common -y
sudo apt-get install gnupg-agent -y
sudo apt-get install gnome-tweak-tool -y

echo "[ubuntu] python3"
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update -y
sudo apt-get install python3.7 -y
sudo apt-get install python3-pip -y

echo "[ubuntu] theme"
sudo unzip -o "ubuntu/assets/San-Francisco-font.zip" -d /usr/share/fonts/truetype
sudo cp "ubuntu/assets/catalina-wallpaper.jpg" /usr/share/backgrounds
sudo apt-get install fonts-hack-ttf -y

echo "[ubuntu] command line utilities"
sudo apt-get install bat -y     # better cat (syntax highlighting)
sudo apt-get install dust -y    # better du -sh
sudo apt-get install yank -y    # copy terminal output to clipboard 
sudo apt-get install fzf -y     # file fuzzy finder

# z jump around directories
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O "$DOTFILES_DIR/z.sh"
