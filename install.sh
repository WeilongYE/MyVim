#!/bin/bash
#install vim
sudo apt-get install python-dev python3-dev ruby-dev libX11-dev libgtk-3-dev ncurses-dev ack-grep ctags
cd ~/
git clone https://github.com/vim/vim.git vim74
cd vim74
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-perlinterp --enable-gui=gtk2 --enable-cscope --prefix=/usr --enable-luainterp 
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
cd ~/
rm -rf ~/vim74
mv ~/.vim ~/.vim_old
mv ~/.vimrc ~/.vimrc
git clone https://github.com/WeilongYE/MyVim.git 
cp -r ~/MyVim/vim ~/.vim
cp  ~/MyVim/vimrc ~/.vimrc
cp -r ~/MyVim/indexer_files ~/.indexer_files
cp -r ~/MyVim/indexer_files_tags ~/.indexer_files_tags

#install ycm
sudo apt-get install build-essential cmake
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
rm -rf .git
rm -f .gitignore
