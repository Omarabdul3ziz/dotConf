#!/bin/bash

set -e

echo ""
echo "------- installing Node, Npm and yarn -------"
echo ""

echo "Cleaning..."
sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/bin/node*
sudo rm -rf /usr/local/include/node*

sudo apt -y purge nodejs npm
sudo apt -y autoremove

echo "Installing..."
wget -O /tmp/node-v18.13.0-linux-x64.tar.xz https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.xz
tar -xf /tmp/node-v18.13.0-linux-x64.tar.xz -C /tmp/
sudo mv /tmp/node-v18.13.0-linux-x64/bin/* /usr/local/bin/
sudo mv /tmp/node-v18.13.0-linux-x64/lib/node_modules/ /usr/local/lib/
sudo npm install -g npm@9.2.0
sudo npm install --global yarn

echo "Verifing..."
node -v
npm -v
yarn --version

