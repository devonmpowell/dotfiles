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
alias notebook='ipython notebook'
alias kils='ssh -X dmpowel1@ki-ls08.slac.stanford.edu'
alias sherlock='ssh -X dmpowel1@sherlock.stanford.edu'
###############################################

# machine-specific things 
HOSTNAME=$(hostname)

# devon-slac (SLAC Ubuntu laptop) 
if [ $HOSTNAME == "devon-slac" ]; then
	export PATH=/home/devon/anaconda/bin:$PATH
	alias notebook='ipython notebook'
	alias kils='ssh -X dmpowel1@ki-ls08.slac.stanford.edu'
	alias sherlock='ssh -X dmpowel1@sherlock.stanford.edu'
fi

# Sherlock
if [ ${HOSTNAME:0:8} == "sherlock" ]; then
	export PATH=$SCRATCH/anaconda2/bin:$PATH
	export LD_LIBRARY_PATH=$SCRATCH/gsl-2.1/lib:$LD_LIBRARY_PATH
	alias notebook='ipython notebook --no-browser --port=9201'
	alias squeue='squeue -u dmpowel1'
	module load intelmpi
	module load cuda 
fi


