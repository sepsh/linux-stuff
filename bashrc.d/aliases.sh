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
my_aliases[ipt]="ip address show tun0"
my_aliases[ipv]="ip address show vpn0"
my_aliases[ipw]="ip address show wlp4s0"
my_aliases[ipe]="ip address show enp0s31f6"


# All aliases will be set in this loop

for key in "${!my_aliases[@]}"; do
	if [[ $(type -t $key) == "" ]]; then
		alias $key="${my_aliases[$key]}"
	fi
done
unset my_aliases

