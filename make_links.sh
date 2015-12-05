#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm $HOME/.bashrc $HOME/.vimrc $HOME/.vim $HOME/.profile
ln -s $DIR/profile $HOME/.profile  
ln -s $DIR/bashrc $HOME/.bashrc  
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/vim $HOME/.vim
ln -s $DIR $HOME/.matplotlibrc

