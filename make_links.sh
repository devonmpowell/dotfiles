#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm $HOME/.bashrc $HOME/.vimrc $HOME/.vim $HOME/.screenrc $HOME/.ssh/config
#ln -s $DIR/profile $HOME/.profile  
ln -s $DIR/bashrc $HOME/.bashrc  
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/vim $HOME/.vim
ln -s $DIR/screenrc $HOME/.screenrc
mkdir -p $HOME/.matplotlib
ln -s $DIR/matplotlibrc $HOME/.matplotlib/matplotlibrc
ln -s $DIR/ssh_config $HOME/.ssh/config
source $HOME/.bashrc $HOME/.vimrc $HOME/.vim $HOME/.screenrc

