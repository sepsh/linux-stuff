# Aliases for "ip"
# this files will be sources by aliases.sh


# Static aliases

my_aliases[ipa]="ip address show"


# Dynamic aliases

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
unset interface_names
unset interface
unset shorthand
