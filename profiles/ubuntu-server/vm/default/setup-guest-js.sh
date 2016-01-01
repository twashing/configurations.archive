#!/bin/bash

# taken from: https://nodesource.com/blog/nodejs-v012-iojs-and-the-nodesource-linux-repositories#node-js-v0-10
curl -sL https://deb.nodesource.com/setup_0.10 | sudo bash -
sudo apt-get install -y nodejs  # node

# sudo npm install -g yo &&
sudo npm install -g grunt &&
sudo npm install -g grunt-cli &&
sudo npm install -g bower


