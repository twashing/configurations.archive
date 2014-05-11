#!/bin/bash


# Git 
echo "Installing Git..."
apt-get update
apt-get -y install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
apt-get -y install git

# Java 
echo "Installing Java..."
apt-get -y install python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get -y install oracle-java7-installer

# Leiningen
echo "Installing Leiningen..."
mkdir ~/bin
wget -O ~/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod u+x ~/bin/lein
~/bin/lein

# Interruptsoftware.com project
echo "Downloading Interruptsoftware.com project..."
mkdir ~/Project && cd ~/Project
git clone https://github.com/twashing/interruptsoftware.git
cd interruptsoftware/ 
ll

