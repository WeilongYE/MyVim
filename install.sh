#!/bin/bash
#install vim
sudo apt-get install python-dev python3-dev ruby-dev libX11-dev libgtk-3-dev ncurses-dev ack-grep exuberant-ctags silversearcher-ag
cd ~
git clone https://github.com/WeilongYE/MyVim.git 
cd ~/MyVim
git checkout new
cp -r ~/MyVim/vim ~/.vim
cp  ~/MyVim/vimrc ~/.vimrc
