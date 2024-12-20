#!/bin/bash

# Create a link to bashrc.d in ~/.bashrc.d

bashrcd_source="$( dirname $(realpath $BASH_SOURCE) )/bashrc.d"
bashrcd_target="$HOME/.bashrc.d"
if [[ ! -d $bashrcd_source ]]; then
	echo "Error! '$bashrcd_source' not found."
	exit 1
elif [[ -e $bashrcd_target ]]; then
	echo "Skipping: '$bashrcd_target' exists."
else
	echo "Linkling '$bashrcd_target' -> '$bashrcd_source'"
	ln -s $bashrcd_source $bashrcd_target
fi
unset bashrcd_source bashrcd_target


# Configre "~/.bashrc" to source "~/.bashrc.d/00-main.sh"

bashrc_d_source_script="BASHRC_D_MAIN_SH_SOULD_RUN=true; source ~/.bashrc.d/00-main.sh; unset BASHRC_D_MAIN_SH_SOULD_RUN"
case $(cat ~/.bashrc) in
	*"$bashrc_d_source_script"*)
		echo "Skipping: '~/.bashrc' is already configures to source '~/.bashrc.d/00-main.sh'."
	;;
	*".bashrc.d"*)
		echo "Skipping: '~/.bashrc' contains other configuration pointing to '~/.bashrc.d'."
	;;
	*)
		echo "Configuring '~/.bashrc' to source '~/.bashrc.d/00-main.sh'..."
		echo -e "\n# Created automatically by $(realpath $BASH_SOURCE)\n# commit: '$(git rev-parse HEAD)'" >> ~/.bashrc
		echo -e "$bashrc_d_source_script\n" >> ~/.bashrc

	;;
esac
unset $bashrc_d_source_script

