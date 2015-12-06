###############################################
# .bashrc
# GLOBAL (do not change): 
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias kils='ssh -X dmpowel1@ki-ls08.slac.stanford.edu'
alias sherlock='ssh -X dmpowel1@sherlock.stanford.edu'
###############################################

# host-specific things 
HOSTNAME=$(hostname)

# devon-slac (SLAC Ubuntu laptop) 
if [ $HOSTNAME == "devon-slac" ]; then
	export PATH=/home/devon/anaconda/bin:$PATH
	alias notebook='ipython notebook'
fi

# Sherlock
if [ ${HOSTNAME:0:8} == "sherlock" ]; then
	module load intelmpi
	export PATH=/scratch/users/dmpowel1/anaconda2/bin:$PATH
	alias notebook='ipython notebook --no-browser --port=8889'
fi


