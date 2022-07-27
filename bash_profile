#!/bin/bash

#################
# .bash_profile #
#################

########################################################
# Machine-specific things
########################################################

HOSTNAME=$(hostname)

# lappy and mpa-lappy (personal Ubuntu systems)
if [[ $HOSTNAME == "lappy" ]]; then
	CONDA_HOME="/home/devon/anaconda3"
fi
if [[ $HOSTNAME == "mpa-lappy" ]]; then
	CONDA_HOME="/usr/local/anaconda3"
fi


# Freya at MPA
if [[ $HOSTNAME == "freya"* ]]; then

	# load modules
	module load intel/19.1.3
	module load impi/2019.9
	module load cuda/11.4
	module load petsc-real-double/3.13.5
	module load git 
	module load fftw-serial/3.3.10

	# gsl
	module load gsl/2.4
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GSL_HOME/lib"

	# locally-installed software
	MY_PACKAGES="/u/dmpowell/packages"

	# casa
	# Make sure this come before Anaconda, so that the 
	# defualt python install is not hijacked!
	export PATH="$MY_PACKAGES/casa-release-5.3.0-143.el7/bin:$PATH"
	alias casapy="$MY_PACKAGES/casa-release-5.3.0-143.el7/bin/python"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MY_PACKAGES/casacore/lib"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MY_PACKAGES/boost_1_67_0/stage/lib"

	# anaconda
	module load anaconda/3/2021.11
	#module load pytorch/gpu-cuda-11.4/1.10.0
	CONDA_HOME=$CONDA_PREFIX

	# Adding my own Pythons scripts to the path
	export PYTHONPATH="$PYTHONPATH:/u/dmpowell/reconstruction_2020/scripts"

	# ds9 viewer
	export PATH="$MY_PACKAGES/ds9:$PATH"

	# archive
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MY_PACKAGES/libarchive-3.4.3/lib"
	export PATH="$PATH:$MY_PACKAGES/libarchive-3.4.3"
	
	#PGPLOT
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MY_PACKAGES/pgplot/"
	export PGPLOT_DIR="$MY_PACKAGES/pgplot/"
	export PGPLOT_FONT="$MY_PACKAGES/pgplot/grfont.dat"
	export PGPLOT_DEV=/XWINDOW
	export CLICOLOR='true'
	export LSCOLORS="gxfxcxdxbxegedabagacad"

	# Prevent programs from hijacking the whole login node
	export OMP_NUM_THREADS=1
	export OMP_THREAD_LIMIT=1
fi

# Raven at MPCDF 
if [[ $HOSTNAME == "rav"* ]]; then
	CONDA_HOME=$CONDA_PREFIX

	# load modules
	module load intel/21.2.0 
	module load impi/2021.2
	module load cuda/11.2 
	module load git 
	module load petsc-real-double

	# anaconda
	module load anaconda/3/2020.02
	CONDA_HOME=$CONDA_PREFIX

	# gsl
	module load gsl
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GSL_HOME/lib"

	# locally-installed software
	MY_PACKAGES="/u/dmpowell/packages"

	# ds9 viewer
	export PATH="$MY_PACKAGES/ds9:$PATH"

	#PGPLOT
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$MY_PACKAGES/pgplot/"
	export PGPLOT_DIR="$MY_PACKAGES/pgplot/"
	export PGPLOT_FONT="$MY_PACKAGES/pgplot/grfont.dat"
	export PGPLOT_DEV=/XWINDOW
	export CLICOLOR='true'
	export LSCOLORS="gxfxcxdxbxegedabagacad"

	# Prevent programs from hijacking the whole login node
	export OMP_NUM_THREADS=1
	export OMP_THREAD_LIMIT=1

fi


##########################
# >>> conda initialize >>>
##########################
if [ -v CONDA_HOME ]; then
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$("$CONDA_HOME/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]; then
			. "$CONDA_HOME/etc/profile.d/conda.sh"
		else
			export PATH="$CONDA_HOME/bin:$PATH"
		fi
	fi
	unset __conda_setup
fi

# leave this at the very end
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
