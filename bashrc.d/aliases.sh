# Add all the aliases to this map

declare -A my_aliases


# All aliases will be set in this loop

for key in "${!my_aliases[@]}"; do
	if [[ $(type -t $key) == "" ]]; then
		alias $key="${my_aliases[$key]}"
	fi
done
unset my_aliases

