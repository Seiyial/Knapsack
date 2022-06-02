# oh-my-zsh
echo 'export ZSH="$HOME/.oh-my-zsh"\nZSH_THEME="obraun"\nplugins=(git)\nsource $ZSH/oh-my-zsh.sh\n' > ~/.zshrc
source ~/.zshrc
# ^ not sure if this works, if it doesn't restart

# Setups
timedatectl set-timezone Asia/Singapore

# Lang basics
apt install build-essential -y

# NodeJS version pick
apt install unzip -y
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
source ~/.zshrc
fnm ls-remote
printf "\nInstall which NodeJS version?\n>> "
read ks_nodeversion
fnm install $ks_nodeversion
fnm default $ks_nodeversion
echo "eval "$(fnm env --use-on-cd)"" >> ~/.zshrc
ln -s $HOME/.fnm/aliases/default/node /usr/bin/node

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Python
curl https://pyenv.run | bash
echo '# pyenv: Python version manager\nexport PYENV_ROOT="$HOME/.pyenv"\ncommand -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"\neval "$(pyenv init - --no-rehash)"' >> ~/.zshrc
source ~/.zshrc
pyenv install --list
printf "\nInstall which Python version?\n>> "
read ks_pyversion
pyenv install $ks_pyversion
pyenv global $ks_pyversion

# NGINX
apt install nginx -y

# UFW
ufw allow ssh
ufw allow "Nginx Full"
ufw enable

# PostgreSQL
apt install postgresql postgresql-contrib
systemctl start postgresql
systemctl enable postgresql

# Custom scripts
mkdir $HOME/bin
echo "\n\nexport PATH=\$PATH:$HOME/bin" >> $HOME/.zshrc
