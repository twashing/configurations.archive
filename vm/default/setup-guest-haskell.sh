#!/bin/bash

mkdir ~/Tools
cd ~/Tools

# GHC Bineries are here: https://www.haskell.org/ghc/
wget https://www.haskell.org/ghc/dist/7.8.4/ghc-7.8.4-i386-unknown-linux-deb7.tar.bz2
tar xvjf ghc-7.8.4-i386-unknown-linux-deb7.tar.bz2

cd ghc-7.8.4
./configure && sudo make install

# Cabal downloads are here: https://www.haskell.org/cabal/download.html
cd ~/Tools/
wget https://www.haskell.org/cabal/release/cabal-1.22.0.0/Cabal-1.22.0.0.tar.gz
tar xvzf Cabal-1.22.0.0.tar.gz
cd Cabal-1.22.0.0

ghc -threaded --make Setup
./Setup configure
./Setup build
sudo ./Setup install

cd ~/Tools/
get https://www.haskell.org/cabal/release/cabal-install-1.22.0.0/cabal-install-1.22.0.0.tar.gz
tar xvzf cabal-install-1.22.0.0.tar.gz
cd cabal-install-1.22.0.0/
./bootstrap.sh
cabal update


# ghc-mod
cabal install ghc-mod
