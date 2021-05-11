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
alias mpa='ssh -X dmpowell@slogin.mpa-garching.mpg.de'
alias freya='ssh -X dmpowell@freya04.bc.rzg.mpg.de'
alias cobra='ssh -X dmpowell@cobra02i.mpcdf.mpg.de'
alias raven='ssh -X dmpowell@raven02i.mpcdf.mpg.de'
###############################################


# machine-specific things 
HOSTNAME=$(hostname)

# Freya at MPA 
if [ ${HOSTNAME:0:5} == "freya" ]; then

	# load modules
	module load intel 
	module load impi
	module load cuda 
	module load git 

	# useful aliases
	alias cpurun='srun --partition=p.24h --time=01:00:00 --nodes=1' 
	alias gpurun='srun --partition=p.gpu --gres=gpu:2 --time=01:00:00 --nodes=1' 
	alias nb_bg_start='nohup ipython notebook --no-browser --port=1029 &' 
	alias interactive='unset I_MPI_HYDRA_BOOTSTRAP; unset I_MPI_PMI_LIBRARY; export I_MPI_SHM_LMT=shm'

	# casa
	# Make sure this come before Anaconda, so that the 
	# defualt python install is not hijacked!
	export PATH="/u/dmpowell/packages/casa-release-5.3.0-143.el7/bin:$PATH"
	alias casapy="/u/dmpowell/packages/casa-release-5.3.0-143.el7/bin/python"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/casacore/lib"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/boost_1_67_0/stage/lib"

	# Anaconda local install 
	#module load anaconda 
	export PATH="/u/dmpowell/packages/anaconda2/bin:$PATH"
	export PYTHONPATH="/u/dmpowell/packages/anaconda2"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/anaconda2/lib"

	# Adding my own Pythons scripts to the path
	PYTHONPATH="$PYTHONPATH:/u/dmpowell/reconstruction_2020/scripts"

	# PETSc install 
	#module load petsc-real

	# openmp
	export OMP_NUM_THREADS=1
	export OMP_THREAD_LIMIT=1

	# ds9 viewer
	export PATH="/u/dmpowell/packages/ds9:$PATH"

	# archive
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/libarchive-3.4.3/lib"
	export PATH="$PATH:/u/dmpowell/packages/libarchive-3.4.3"
	
	# gsl
	#module load gsl
	export GSL_HOME="/u/dmpowell/packages/gsl-2.6"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GSL_HOME/lib"
	
	#PGPLOT
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/pgplot/"
	export PGPLOT_DIR="/u/dmpowell/packages/pgplot/"
	export PGPLOT_FONT="/u/dmpowell/packages/pgplot/grfont.dat"
	export PGPLOT_DEV=/XWINDOW
	export CLICOLOR='true'
	export LSCOLORS="gxfxcxdxbxegedabagacad"
fi

# MPCDF Cobra 
if [ ${HOSTNAME:0:5} == "cobra" ]; then

	# load modules
	module load intel 
	module load impi
	module load cuda 
	module load git 
	module load petsc-real-double
	module load anaconda/2/2019.03 

	# useful alias
	alias cpurun='srun --partition=interactive --nodes=1' 
	alias gpurun='srun --partition=gpudev --gres=gpu:v100:2 --time=00:14:59 --nodes=1' 

	# gsl
	module load gsl
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GSL_HOME/lib"

	# ds9 viewer
	export PATH="/u/dmpowell/packages/ds9:$PATH"

	#PGPLOT
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/u/dmpowell/packages/pgplot/"
	export PGPLOT_DIR="/u/dmpowell/packages/pgplot/"
	export PGPLOT_FONT="/u/dmpowell/packages/pgplot/grfont.dat"
	export PGPLOT_DEV=/XWINDOW
	export CLICOLOR='true'
	export LSCOLORS="gxfxcxdxbxegedabagacad"

	# openmp
	export OMP_NUM_THREADS=1
	export OMP_THREAD_LIMIT=1

fi



# devon-mpa (work laptop)
if [ $HOSTNAME == "devon-mpa-lappy" ]; then

	export SCPFREYA=dmpowell@freya04.bc.rzg.mpg.de
	alias notebook='ipython notebook'
	alias freya-notebook-tunnel='ssh -nNT -L 9999:localhost:1029 dmpowell@freya04.bc.rzg.mpg.de'

	# gsl
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"

	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/home/devon/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/home/devon/anaconda3/etc/profile.d/conda.sh" ]; then
	        . "/home/devon/anaconda3/etc/profile.d/conda.sh"
	    else
	        export PATH="/home/devon/anaconda3/bin:$PATH"
	    fi
	fi
	unset __conda_setup

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

