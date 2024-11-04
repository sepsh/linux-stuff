# Source every .sh file in current working directory

if test "$BASHRC_D_MAIN_SH_SOULD_RUN" = "true"; then

this_file=$(realpath $BASH_SOURCE)
here=$(dirname $this_file)
for rc in $here/*.sh; do
	case $rc in
		"$this_file") continue ;;
		*) source $rc ;;
	esac
done
unset rc here this_file

fi
