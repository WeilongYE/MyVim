#!/bin/bash
#install vim
sudo apt-get install ack-grep exuberant-ctags silversearcher-ag
cd ~
git clone https://github.com/WeilongYE/MyVim.git 
cd ~/MyVim
git checkout new
cp -r ~/MyVim/vim ~/.vim
cp  ~/MyVim/vimrc ~/.vimrc
rm -rf ~/MyVim
