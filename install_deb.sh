#!/bin/sh

echo "🍬 Welcome to Gummies! This script will:"
echo "  - ⚙️  Install Gum, the TUI toolkit"
echo "  - ✅ Download gummy-get, the Gummies manager"
echo "  - 📦 Run gummy-get to select Gummies"
echo "Is that OK with you? (y/n)"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if [ "$answer" != "${answer#[Yy]}" ];then
    echo "Great!"
else
    exit
fi
echo "This script was made for Debian, Ubuntu, and derivatives."
echo "Are you on one of these? (y/n)"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if [ "$answer" != "${answer#[Yy]}" ];then
    echo "Ok!"
else
    exit
fi
echo "🔑 Adding the Charm key and repository to your system..."
echo "🦸 Script requires root privileges."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
echo "📦 Installing Gum..."
sudo apt update
sudo apt install gum
echo "✅ Done!"

