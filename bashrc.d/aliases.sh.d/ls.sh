# Aliases for "ls"
# this files will be sources by aliases.sh

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
