#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##################################################
# Careful! This will nuke the existing dotfiles. #
##################################################

# matplotlibrc
mkdir -p $HOME/.config/matplotlib
rm $HOME/.config/matplotlib/matplotlibrc
ln -s $DIR/matplotlibrc $HOME/.config/matplotlib/matplotlibrc

# ssh
mkdir -p $HOME/.ssh
mkdir -p $HOME/.ssh/controlmasters
rm $HOME/.ssh/config
ln -s $DIR/ssh_config $HOME/.ssh/config
chmod 700 $HOME/.ssh
chmod 644 $HOME/.ssh/config
# TODO: set up key pairs
#ssh-keygen -t rsa -b 4096 -N '' -C "devonmpowell1@gmail.com" -f ~/.ssh/id_rsa
#ssh-add ~/.ssh/id_rsa
#chmod 600 ~/.ssh/id_rsa

# vim
rm $HOME/.vimrc $HOME/.vim
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/vim $HOME/.vim

# bashrc
rm $HOME/.bashrc
ln -s $DIR/bashrc $HOME/.bashrc  

# bash_profile for different systems...
rm $HOME/.bash_profile
ln -s $DIR/bash_profile $HOME/.bash_profile
source $HOME/.bash_profile


