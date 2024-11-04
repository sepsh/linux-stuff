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


# Configre "~/.bashrc" to inclued .sh files from "~/.bashrc.d/"

(
bashrc_d_load_script="if test -d ~/.bashrc.d; then for rc in ~/.bashrc.d/*.sh; do if test -f \$rc; then . \$rc ; fi; done; unset rc ; fi"
case $(cat ~/.bashrc) in
	*"$bashrc_d_load_script"*)
		echo -e "Skipping...\n\t'~/.bashrc' is already configured to include '~/.bashrc.d/*.sh'."
	;;
	*)
		echo "Configuring '~/.bashrc' to include '~/.bashrc.d/*.sh'..."
		echo -e "\n# Created automatically by $(realpath $BASH_SOURCE)" >> ~/.bashrc
		echo -e "\tAppend"
		echo -e "\t\"$bashrc_d_load_script\""
		echo -e "\tto"
		echo -e "\t\"~/.bashrc\""
		echo $bashrc_d_load_script >> ~/.bashrc
		echo "" >> ~/.bashrc
	;;
esac
)

