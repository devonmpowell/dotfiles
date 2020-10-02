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
alias mpa='ssh -X dmpowell@slogin.mpa-garching.mpg.de'
alias freya='ssh -X dmpowell@freya04.bc.rzg.mpg.de'
###############################################


# machine-specific things 
HOSTNAME=$(hostname)

# Freya at MPA 
if [ ${HOSTNAME:0:5} == "freya" ]; then
	alias notebook='ipython notebook --no-browser' 
	alias squeue='squeue -u dmpowell'
	alias interactive='unset I_MPI_HYDRA_BOOTSTRAP; unset I_MPI_PMI_LIBRARY'
	module load intel 
	module load impi
	module load mkl 
	module load cuda 
	module load anaconda 
	module load git 
	module load cmake 

	# my own PETSc install (with Cuda enabled)
	#module load petsc-real
	export PETSC_DIR="/u/dmpowell/packages/petsc/"
	#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/petsc/arch-linux2-c-debug/lib"
	#export PATH="$PATH:/u/dmpowell/packages/petsc/arch-linux2-c-debug/bin"

	#PGPLOT
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/pgplot/"
	export PGPLOT_DIR="/u/dmpowell/packages/pgplot/"
	export PGPLOT_FONT="/u/dmpowell/packages/pgplot/grfont.dat"
	export PGPLOT_DEV=/XWINDOW
	export CLICOLOR='true'
	export LSCOLORS="gxfxcxdxbxegedabagacad"
fi

# devon-mpa (work laptop)
if [ $HOSTNAME == "devon-mpa-lappy" ]; then
	export PATH=$HOME/anaconda2/bin:$PATH
	export PATH=/usr/local/casa-release-5.3.0-143.el7/bin:$PATH
	export PYTHONPATH=$HOME/anaconda2
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/fftw3/lib:/usr/local/lib
	export PGPLOT_DIR=/usr/local/pgplot
	export SCPFREYA=dmpowell@freya04.bc.rzg.mpg.de
	alias notebook='ipython notebook'
	alias freya-notebook-tunnel='ssh -nNT -L 9999:localhost:1029 dmpowell@freya04.bc.rzg.mpg.de'
fi

# home (Devon's personal laptop)
if [ $HOSTNAME == "home" ]; then
	export PATH=$HOME/anaconda2/bin:$PATH
	export PATH=/usr/local/casa-release-5.3.0-143.el7/bin:$PATH
	export PYTHONPATH=$HOME/anaconda2
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/fftw3/lib:/usr/local/lib
	export PGPLOT_DIR=/usr/local/pgplot
	export SCPFREYA=dmpowell@freya04.bc.rzg.mpg.de
	alias notebook='ipython notebook'
	alias freya-notebook-connect='(ssh -nNT -L 9999:localhost:1029 dmpowell@freya04.bc.rzg.mpg.de &); xdg-open http://localhost:9999/'
	alias slogin-notebook-connect='(ssh -nNT -L 6666:localhost:7777 dmpowell@slogin.mpa-garching.mpg.de)'
	alias hotspot='nmcli device wifi hotspot con-name my-hotspot ssid devon-lappy-hotspot band bg password jesu1sunm0tdepass3'
	alias kils='ssh -X dmpowel1@ki-ls08.slac.stanford.edu'
	alias sherlock='ssh -X dmpowel1@sherlock.stanford.edu'
fi
