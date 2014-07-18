#!/bin/bash

sudo apt-get update && 

# Create New User
script_create_user=$(cat <<'EOF'
adduser --disabled-password --gecos "" $0
passwd $0
chown $0:users "/home/$0"
EOF
)

echo; echo ">> Creating New User (as root)..."
echo -n "Please supply a username: "
read line
sudo sh -c "$script_create_user" $line


# Update Tools
echo; echo ">> Updating Apt-Get listings..."
sudo apt-get update && 

# Tools 
echo; echo ">> Installing General Tools..."
sudo apt-get -y install tree tmux build-essential zlib1g-dev libssl-dev libreadline6-dev gnustep-base-runtime gnupg gnupg-agent &&

# Vim 
echo; echo ">> Installing Vim..."
sudo apt-get install -y vim-nox &&

# Emacs (https://launchpad.net/~cassou/+archive/emacs)
echo; echo ">> Installing Emacs..."
sudo apt-get install -y software-properties-common python-software-properties && 
sudo add-apt-repository ppa:cassou/emacs && sudo apt-get update && sudo apt-get install -y emacs24 &&

# Git 
echo; echo ">> Installing Git..."
sudo apt-get -y install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev &&
sudo apt-get -y install git &&

# Java 
echo; echo ">> Installing Java..."
sudo apt-get -y install python-software-properties &&
sudo add-apt-repository -y ppa:webupd8team/java &&
sudo apt-get update &&
sudo apt-get -y install oracle-java7-installer &&

# Backup old ruby lib & uninstall 
echo; echo ">> Backing up old ruby libs & uninstall..."
sudo mv /opt/vagrant_ruby /opt/vagrant_ruby.bak
sudo apt-get -y remove ruby1.8 &&
sudo apt-get -y remove ruby && 
sudo apt-get -y remove ruby-bundler && 
sudo apt-get -y purge ruby1.8 && 
sudo apt-get -y purge ruby && 
sudo apt-get -y purge ruby-bundler && 
sudo apt-get -y autoremove --purge

# Install RBenv / Ruby-Build
echo; echo ">> Installing Rbenv (Ruby)..."
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv &&
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_local &&
echo 'eval "$(rbenv init -)"' >> ~/.bash_local &&
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build &&
~/.rbenv/bin/rbenv install 2.1.2 &&

# Bundler

# Rails 

# Local install 
sudo su - $line << 'EOF'

echo ">> Runnin local config as[ $(whoami) ]"

# Leiningen
echo; echo ">> Installing Leiningen..."
mkdir ~/bin   # may already exist
wget -O ~/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein &&
chmod u+x ~/bin/lein &&
~/bin/lein

# Configurations
echo; echo ">> Setting Configurations..."
mv ~/.bashrc{,.1}
mkdir -p ~/Projects &&

git clone https://github.com/twashing/configurations.git ~/Projects/configurations &&
ln -s ~/Projects/configurations/bash_profile ~/.bash_profile &&
ln -s ~/Projects/configurations/bashrc ~/.bashrc &&
ln -s ~/Projects/configurations/lein_profiles.clj ~/.lein/profiles.clj &&
ln -s ~/Projects/configurations/tmux.conf ~/.tmux.conf &&
ln -s ~/Projects/configurations/vimrc ~/.vimrc &&

echo 'export PATH="$PATH:~/bin/"' >> ~/.bash_local &&
chmod +x ~/.bash_local &&
~/.bash_local

EOF

# Setup Gnupg Keys

# Setup SSH Keys

# Leiningen GPG Authentication
# https://github.com/technomancy/leiningen/blob/master/doc/DEPLOY.md#authentication

# Invoking gpg-agent 
# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html 

# Emacs Live - do manually; the emacs-live shell is interactive, meaning we have to have a standard input available
#echo; echo ">> Installing Emacs-Live..."

#wget https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh &&
#chmod u+x install-emacs-live.sh
#./install-emacs-live.sh

#mv ~/.live-packs/ten-pack/init.el{,.1}
#ln -s ~/Projects/configurations/init.el ~/.live-packs/ten-pack/init.el
