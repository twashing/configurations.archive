#!/bin/bash


sudo apt-get update && 

# Tools 
echo "Install General Tools"
sudo apt-get -y install tree tmux &&

# Vim 
echo "Installing Git..."
sudo apt-get install -y vim-nox &&

# Emacs (https://launchpad.net/~cassou/+archive/emacs)
echo "Installing Vim..."
sudo apt-get install -y software-properties-common python-software-properties && 
sudo add-apt-repository ppa:cassou/emacs && sudo apt-get update && sudo apt-get install -y emacs24 &&

# Emacs Live
echo "Installing Emacs..."
bash <(curl -fksSL https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh) &&

# Git 
echo "Installing Emacs-Live..."
sudo apt-get -y install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev &&
sudo apt-get -y install git &&

# Java 
echo "Installing Java..."
sudo apt-get -y install python-software-properties &&
sudo add-apt-repository -y ppa:webupd8team/java &&
sudo apt-get update &&
sudo apt-get -y install oracle-java7-installer &&

# Leiningen
echo "Installing Leiningen..."
mkdir ~/bin &&
wget -O ~/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein &&
chmod u+x ~/bin/lein &&
~/bin/lein &&


# Configurations
mkdir Projects &&
git clone https://github.com/twashing/configurations.git Projects/configurations &&
link -s Projects/configurations/bash_profile ~/.bash_profile &&
link -s Projects/configurations/bashrc ~/.bashrc &&
link -s Projects/configurations/init.el ~/.live-packs/$(echo $USER)-pack/init.el &&
link -s Projects/configurations/lein_profiles.clj ~/.lein/profiles.clj &&
link -s Projects/configurations/tmux.conf ~/.tmux.conf &&
link -s Projects/configurations/vimrc ~/.vimrc &&


# Backup old ruby lib & uninstall 
sudo mv /opt/vagrant_ruby /opt/vagrant_ruby.bak
sudo apt-get -y remove ruby1.8 &&
sudo apt-get -y remove ruby && 
sudo apt-get -y remove ruby-bundler && 
sudo apt-get -y purge ruby1.8 && 
sudo apt-get -y purge ruby && 
sudo apt-get -y purge ruby-bundler && 
sudo apt-get -y autoremove --purge

# Install RBenv 
# git clone https://github.com/sstephenson/rbenv.git ~/.rbenv


# Bundler


echo "export PATH=\"$PATH:~/bin/\"" > ~/.bash_local
chmod +x ~/.bash_local
~/.bash_local

