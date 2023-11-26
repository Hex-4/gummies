#!/bin/sh

echo "📦 Welcome to gum-get, the Gummy package manager."
gum spin --title "Updating package index" -- wget -O ~/.config/gummy/gglist.txt https://raw.githubusercontent.com/Hex-4/gummies/main/gg/info/gummy-get-list.txt && sleep 2
GG_PKG=$(cat ~/.config/gummy/gglist.txt | gum choose)
gum spin --spinner line --title "Getting gummy info" -- wget -O ~/config/gummy/$GG_PKG.txt https://raw.githubusercontent.com/Hex-4/gummies/main/gg/info/$GG_PKG.txt && sleep 2
cat ~/config/gummy/$GG_PKG.txt
sleep 2
gum confirm "Want to install this?" && gum spin --spinner pulse --title "Installing $GG_PKG" -- sudo wget -O /usr/local/bin/gummy/g$GG_PKG.txt
echo "Done! Access it with: g$GG_PKG"

