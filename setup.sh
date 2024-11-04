# Create a link to bashrc.d in ~/.bashrc.d

(
bashrcd_source="$PWD/bashrc.d"
bashrcd_target="$HOME/.bashrc.d"
if [[ ! -d $bashrcd_source ]]; then
	echo "Error! '$bashrcd_source' not found."
	exit 1
elif [[ -e $bashrcd_target ]]; then
	echo -e "Skipping...\n\t'$bashrcd_target' exists."
else
	echo "Creating symlink..."
	echo -e "\tMake a symbolic link to"
	echo -e "\t\"$bashrcd_target\""
	echo -e "\tin"
	echo -e "\t\"$bashrcd_source\""
	ln -s $bashrcd_source $bashrcd_target
fi
)


# Configre "~/.bashrc" to source "~/.bashrc.d/main.sh"

bashrc_d_source_script="source ~/.bashrc.d/main.sh"
case $(cat ~/.bashrc) in
	*"$bashrc_d_source_script"*)
		echo -e "Skipping...\n\t'~/.bashrc' is already configures to source '~/.bashrc.d/main.sh'"
	;;
	*)
		echo "Configuring '~/.bashrc' to source '~/.bashrc.d/main.sh'..."
		echo -e "\n# Created automatically by $(realpath $BASH_SOURCE)" >> ~/.bashrc
		echo -e "$bashrc_d_source_script\n" >> ~/.bashrc

	;;
esac
unset $bashrc_d_source_script

