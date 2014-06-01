#!/bin/bash


# Tools 
echo "Install General Tools"
sudo apt-get -y install tree tmux bundler

# Git 
echo "Installing Git..."
sudo apt-get update
sudo apt-get -y install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
sudo apt-get -y install git

# Java 
echo "Installing Java..."
sudo apt-get -y install python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java7-installer

# Leiningen
echo "Installing Leiningen..."
mkdir ~/bin
wget -O ~/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod u+x ~/bin/lein
~/bin/lein

# Interruptsoftware.com project
# echo "Downloading Interruptsoftware.com project..."
# mkdir ~/Project && cd ~/Project
# git clone https://github.com/twashing/interruptsoftware.git

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


