export UV_PYTHON_PREFERENCE=only-managed

if [[ $(type -t vim) == "file" ]]; then
	export EDITOR="$(which vim)"
elif [[ $(type -t vim) == "alias" ]]; then
	export EDITOR="$(which --skip-alias vim)"
elif [[ $(type -t nano) == "file" ]]; then
	export EDITOR="$(which nano)"
elif [[ $(type -t nano) == "alias" ]]; then
	export EDITOR="$(which --skip-alias nano)"
fi

for p in "$HOME/.local/bin" "/usr/local/sbin" "/sbin"; do if [[ $PATH != *"$p"* ]]; then export PATH="$PATH:$p"; fi; done; unset p
