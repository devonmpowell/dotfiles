#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm ~/.bashrc ~/.vimrc ~/.vim
ln -s $DIR/bashrc ~/.bashrc  
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/vim ~/.vim
ln -s $DIR ~/.matplotlibrc

