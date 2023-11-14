#!/bin/bash

###########
# .bashrc #
###########

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# run global bash settings
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

# history settings
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# nice command prompt
# also overrides the annoying "(base)" from conda
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# useful aliases for all systems
alias ls='ls --color=auto'
alias ll='ls -lrt'
alias grep='grep --color=auto'
alias rm='rm -i' 


########################################################
# Machine-specific aliases                           
########################################################

HOSTNAME=$(hostname)

# lappy and mpa-lappy (personal Ubuntu systems)
if [[ $HOSTNAME == *"lappy"* ]]; then
	alias notebook='jupyter notebook'
	alias freya-notebook-connect='ssh -nNT -L 9999:localhost:1029 freya; xdg-open http://localhost:9999/'
	alias raven-notebook-connect='ssh -nNT -L 8118:localhost:1029 raven; xdg-open http://localhost:8118/'

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
	        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
	    else
	        export PATH="/usr/local/anaconda3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
fi


# Freya at MPA
if [[ $HOSTNAME == "freya"* ]]; then
	alias cpurun='srun --partition=p.24h --time=01:00:00 --nodes=1' 
	alias gpurun='srun --partition=p.test --gres=gpu:2 --time=00:30:00'
	alias nbstart='nohup ipython notebook --no-browser --port=1029 &' 
	alias interactive='unset I_MPI_HYDRA_BOOTSTRAP; unset I_MPI_PMI_LIBRARY; export I_MPI_SHM_LMT=shm'
	alias sq='squeue --me --format="%.18i %.9P %.24j %.2t %.10M %.6D %R"'
fi

# Raven at MPCDF 
if [[ $HOSTNAME == "rav"* ]]; then
	alias cpurun='srun --mem=120000 --time=00:30:00' 
	alias gpurun='srun --constraint="gpu" --gres=gpu:a100:1 --mem=125000 --time=00:00:30' 
	alias nbstart='nohup ipython notebook --no-browser --port=1029 &' 
	alias sq='squeue --me --format="%.18i %.9P %.24j %.2t %.10M %.6D %R"'
fi



