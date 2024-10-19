# Create a link to bashrc.d in ~/.bashrc.d

bashrcd_source="$PWD/bashrc.d"
bashrcd_target="$HOME/.bashrc.d"
if [[ ! -d $bashrcd_source ]]; then
	echo "'$bashrcd_source' not found. skipping..."
elif [[ -e $bashrcd_target ]]; then
	echo "'$bashrcd_target' exists. skipping..."
else
	echo "Creating symlink"
	(
	set -x;
	ln -s $bashrcd_source $bashrcd_target
	)
fi

# Configre "~/.bashrc" to load .sh files from "~/.bashrc.d/"

if [[ ! $(cat ~/.bashrc | grep '.bashrc.d') ]]; then
	echo "Configuring '~/.bashrc' to include './.bashrd.d/*sh'"
	cat << EOF >> ~/.bashrc
# Created automatically by https://github.com/sepsh/linux-stuff/blob/main/setup.sh

if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*.sh; do
		if [ -f \$rc ]; then
			. "\$rc"
		fi
	done
fi
unset rc

EOF
else
	echo "'~/.bashrc' is configured. skipping..."
fi
