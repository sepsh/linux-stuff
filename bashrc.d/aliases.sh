# Add all the aliases to this map

declare -A my_aliases


# Aliases for "ls"

if [[ $(type -t ls) == "alias" ]]; then
	ls="${BASH_ALIASES[ls]}"
else
	ls="ls"
fi
my_aliases[l]="$ls"
my_aliases[ll]="$ls -l"
my_aliases[la]="$ls -a"
my_aliases[lla]="$ls -la"
my_aliases[lal]="$ls -al"
unset ls

# Aliases for "ip"

my_aliases[ipa]="ip address show"
declare -A my_interfaces
interface_names=$(
	ip link show | \
	grep -E '^[[:digit:]]+:[[:space:]]+[[:alnum:]]+:.+$' | \
	awk '{print substr($2,1,length($2)-1)}'
)
for interface in $interface_names; do
	shorthand="$(echo $interface | awk '{print substr($0,1,1)}')"
	my_aliases["ip$shorthand"]="ip address show $interface"
done
unset my_interfaces


# All aliases will be set in this loop

for key in "${!my_aliases[@]}"; do
	if [[ $(type -t $key) == "" ]]; then
		alias $key="${my_aliases[$key]}"
	fi
done
unset my_aliases

