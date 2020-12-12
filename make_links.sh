#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p $HOME/.matplotlib
mkdir -p $HOME/.ssh
rm $HOME/.bashrc $HOME/.vimrc $HOME/.vim $HOME/.screenrc $HOME/.matplotlib/matplotlibrc $HOME/.ssh/config
ln -s $DIR/bashrc $HOME/.bashrc  
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/vim $HOME/.vim
ln -s $DIR/screenrc $HOME/.screenrc
ln -s $DIR/matplotlibrc $HOME/.matplotlib/matplotlibrc
ln -s $DIR/ssh_config $HOME/.ssh/config
source $HOME/.bashrc $HOME/.vimrc $HOME/.vim $HOME/.screenrc $HOME/.matplotlib/matplotlibrc $HOME/.ssh/config
