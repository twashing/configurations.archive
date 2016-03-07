echo; echo ">> Installing Curl..."
sudo apt-get -y install curl

# Update Tools
echo; echo ">> Installing Updating Tools..."
sudo apt-get update

# Tools
echo; echo ">> Installing Tools..."
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
    sudo apt-get -y build-dep python3 &&
    sudo make install &&

    sudo apt-get -y install python-pip &&
    pip install -U pip setuptools

# Emacs
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
sudo add-apt-repository -y ppa:git-core/ppa && sudo apt-get update
sudo apt-get -y install git

mkdir -p ~/Projects
cd ~/Projects

# Bashmarks
git clone git://github.com/huyng/bashmarks.git
cd bashmarks
make install

# Configurations
mv ~/.bashrc{,.1}

git clone git@github.com:syl20bnr/spacemacs.git ~/.emacs.spacemacs
git clone https://github.com/twashing/configurations.git ~/Projects/configurations &&
ln -s ~/Projects/configurations/profiles/core/etc/bash_profile ~/.bash_profile &&
ln -s ~/Projects/configurations/profiles/core/etc/bashrc ~/.bashrc &&
ln -s ~/Projects/configurations/profiles/core/etc/tmux.conf ~/.tmux.conf &&
ln -s ~/Projects/configurations/profiles/core/etc/vimrc ~/.vimrc
ln -s ~/Projects/configurations/profiles/core/etc/spacemacs ~/.spacemacs

rm -rf ~/.emacs.d/
ln -s ~/.emacs.spacemacs ~/.emacs.d

echo 'export PATH="$PATH:~/bin/"' >> ~/.bash_local &&
chmod +x ~/.bash_local &&
~/.bash_local



# Powerline
# http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
# sudo pip install --user git+git://github.com/Lokaltog/powerline
# cd ~/Downloads
# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
# fc-cache -vf ~/.fonts
# mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
# 
# cd ~/Projects/
# git clone git@github.com:milkbikis/powerline-shell.git
# cd powerline-shell/
# cp config.py.dist config.py
# ./install.py
# ln -s powerline-shell.py ~/powerline-shell.py
# . ~/.bash_profile
