#!/bin/bash


#function create-user() {
#}

# Change to Root
echo; echo ">> Creating New User (as root)..."
sudo su - -c bash <(curl -fksSL https://raw.githubusercontent.com/twashing/configurations/master/vm/default/setup-add-user.sh)
#sudo su - << 'EOF'

# New User (see here: https://www.debian-administration.org/article/2/Adding_new_users)

#echo -n "Please supply a username: "
#read line
#adduser --disabled-password --gecos "" $line

#passwd $line
#chown $line:users "/home/$line"
#EOF

# Change to New User 
#sudo su - $line

# Update Tools
echo; echo ">> Updating Apt-Get listings..."
sudo apt-get update && 

# Tools 
echo; echo ">> Installing General Tools..."
sudo apt-get -y install tree tmux build-essential zlib1g-dev libssl-dev libreadline6-dev &&

# Vim 
echo; echo ">> Installing Vim..."
sudo apt-get install -y vim-nox &&

# Emacs (https://launchpad.net/~cassou/+archive/emacs)
echo; echo ">> Installing Emacs..."
sudo apt-get install -y software-properties-common python-software-properties && 
sudo add-apt-repository ppa:cassou/emacs && sudo apt-get update && sudo apt-get install -y emacs24 &&

# Emacs Live
echo; echo ">> Installing Emacs-Live..."
bash <(curl -fksSL https://raw.github.com/overtone/emacs-live/master/installer/install-emacs-live.sh) &&

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

# Leiningen
echo; echo ">> Installing Leiningen..."
mkdir ~/bin   # may already exist
wget -O ~/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein &&
chmod u+x ~/bin/lein &&
lein

# Configurations
echo; echo ">> Setting Configurations..."
mkdir -p Projects &&
git clone https://github.com/twashing/configurations.git Projects/configurations &&
ln -s ~/Projects/configurations/bash_profile ~/.bash_profile &&
ln -s ~/Projects/configurations/bashrc ~/.bashrc &&
ln -s ~/Projects/configurations/init.el ~/.live-packs/$(echo $USER)-pack/init.el &&
ln -s ~/Projects/configurations/lein_profiles.clj ~/.lein/profiles.clj &&
ln -s ~/Projects/configurations/tmux.conf ~/.tmux.conf &&
ln -s ~/Projects/configurations/vimrc ~/.vimrc &&

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


echo 'export PATH="$PATH:~/bin/"' >> ~/.bash_local &&
chmod +x ~/.bash_local &&
~/.bash_local

