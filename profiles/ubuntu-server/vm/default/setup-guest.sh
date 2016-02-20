#!/bin/bash

echo -n "What's your git name: "
read gitname

echo -n "What's your git email: "
read gitemail

# Create New User
script_create_user=$(cat <<'EOF'
adduser --disabled-password --gecos "" $0
passwd $0
chown $0:users "/home/$0"
EOF
)

echo; echo ">> Creating New User (as root)..."
echo -n "Please supply a username: "
read username
sudo sh -c "$script_create_user" $username


# Update Tools
echo; echo ">> Updating Apt-Get listings..."
sudo apt-get update

# Tools 
echo; echo ">> Installing General Tools..."
sudo apt-get -y install tree tmux build-essential zlib1g-dev libssl-dev libreadline6-dev gnustep-base-runtime gnupg gnupg-agent unzip autoconf libgmp3-dev libncurses5-dev &&
    sudo apt-get -y install rlwrap

# Vim 
echo; echo ">> Installing Vim..."
sudo apt-get install -y vim-nox

# Python
echo; echo ">> Installing Python..."
sudo apt-get -y install software-properties-common
wget -P ~/Downloads https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz &&
    tar xvzf ~/Downloads/Python-3.5.1.tgz -C ~/Downloads/ &&
    cd ~/Downloads/Python-3.5.1 &&
    ./configure &&
    make &&
    # make test &&
    sudo apt-get -y build-dep python3.4 &&
    sudo make install &&

    sudo apt-get -y install python-pip &&
    pip install -U pip setuptools

# Emacs (https://launchpad.net/~cassou/+archive/emacs)
# See here for manual install of latest version: http://ubuntuhandbook.org/index.php/2014/10/emacs-24-4-released-install-in-ubuntu-14-04/
echo; echo ">> Installing Emacs..."
sudo apt-get -y build-dep emacs24
wget -P ~/Downloads http://gnu.mirror.vexxhost.com/emacs/emacs-24.5.tar.gz
cd ~/Downloads
tar xvzf emacs-24.5.tar*  -C ~/Downloads/
cd ~/Downloads/emacs-24.5/
sudo apt-get -y install libxpm-dev libjpeg-dev libgif-dev libtiff5-dev
./configure --with-x-toolkit=no && make && sudo make install

# Git 
echo; echo ">> Installing Git..."
sudo apt-get -y install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev &&
sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update
sudo apt-get -y install git &&

git config --global user.name $gitname
git config --global user.email $gitemail

# Add user to SUDOers
sudo adduser $username sudo

# Local install 
sudo su - $username << 'EOF'

echo ">> Running local config as[ $(whoami) ]"

# Bashmarks
git clone git://github.com/huyng/bashmarks.git
cd bashmarks
make install


# Configurations
echo; echo ">> Setting Configurations..."
mv ~/.bashrc{,.1}
mkdir -p ~/Projects &&


git clone https://github.com/twashing/configurations.git ~/Projects/configurations &&
ln -s ~/Projects/configurations/profiles/core/etc/bash_profile ~/.bash_profile &&
ln -s ~/Projects/configurations/profiles/core/etc/bashrc ~/.bashrc &&
ln -s ~/Projects/configurations/profiles/core/etc/tmux.conf ~/.tmux.conf &&
ln -s ~/Projects/configurations/profiles/core/etc/vimrc ~/.vimrc &&

echo 'export PATH="$PATH:~/bin/"' >> ~/.bash_local &&
chmod +x ~/.bash_local &&
~/.bash_local


# Powerline
# http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
pip install --user git+git://github.com/Lokaltog/powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

EOF

# Setup Gnupg Keys

# Setup SSH Keys

# Add $username to SUDOers file
# Add Rails-Pack, with Rinari (https://github.com/cap10morgan/rails-pack)

# Leiningen GPG Authentication
# https://github.com/technomancy/leiningen/blob/master/doc/DEPLOY.md#authentication

# Invoking gpg-agent 
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html 

# http://brondsema.net/blog/index.php/2007/02/06/keychain_gpg_agent_pinentry_problems
# http://v3.tronche.com/section/system-administration/solved-gpg-agent-or-pinentry-ssh-or-su-not-working-linux-unix
# http://lists.gnupg.org/pipermail/gnupg-users/2006-May/028548.html
# http://www.ianatkinson.net/computing/gnupg.htm

# Emacs Live - do manually; the emacs-live shell is interactive, meaning we have to have a standard input available
#echo; echo ">> Installing Emacs-Live..."

#wget https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh &&
#chmod u+x install-emacs-live.sh
#./install-emacs-live.sh

#mv ~/.live-packs/ten-pack/init.el{,.1}
#ln -s ~/Projects/configurations/init.el ~/.live-packs/ten-pack/init.el

# turn off Floobits in emacs live (see .emacs.d/packs/stable/power-pack/init.el)

# eliminate vagrant warning "Warning: Authentication failure. Retrying":
# http://stackoverflow.com/questions/24867490/coreos-authentication-failure-on-vagrant-up


