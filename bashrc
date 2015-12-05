# .bashrc

###############################################
# GLOBAL (do not change): 
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi
export HISTCONTROL=ignoreboth:erasedups  # no duplicate entries
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias notebook='ipython notebook'
alias kils='ssh -X dmpowel1@ki-ls08.slac.stanford.edu'
alias sherlock='ssh -X dmpowel1@sherlock.stanford.edu'
###############################################


###############################################
# Ubuntu:
export PATH=/home/devon/anaconda/bin:$PATH
###############################################


###############################################
# Sherlock:
#module load intelmpi # Intel MPI compiler
#export PATH=/scratch/users/dmpowel1/anaconda2/bin:$PATH # Anaconda for python
###############################################






