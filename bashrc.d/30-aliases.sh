# Add all the aliases to this map

declare -A my_aliases


# They can also be set in ~/.bashrc.d/aliases.sh.d/*.sh

if [ -d ~/.bashrc.d/aliases.sh.d ]; then
	for al_rc in ~/.bashrc.d/aliases.sh.d/*.sh; do
		if [ -f $al_rc ]; then
			. "$al_rc"
		fi
	done
fi
unset al_rc

# All aliases will be set in this loop


for key in "${!my_aliases[@]}"; do
	case $(type -t $key) in
		"" | "alias")
			alias $key="${my_aliases[$key]}"
			;;
		*) ;;
	esac
done
unset my_aliases
unset key

