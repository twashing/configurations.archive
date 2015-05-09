#!/bin/bash


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
~/.rbenv/bin/rbenv install 2.1.5 &&
. .bash_local &&
rbenv global 2.1.5 &&

# Bundler
gem install bundler

# Rails 
gem install rails

# ** TODO - remove this rails dependency
sudo apt-get install libsqlite3-dev &&


