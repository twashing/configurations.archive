#!/bin/bash


# requires an install of GHC, GHCi and Cabal-Install

curl -sL https://deb.nodesource.com/setup_0.10 | sudo bash -
sudo apt-get install -y nodejs  # node

cabal install purescript  # psci
npm install -g pulp

