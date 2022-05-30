# Basics
apt update
apt list --upgradable
apt upgrade -y

# Shell
apt install zsh -y

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
