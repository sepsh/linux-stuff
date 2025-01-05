function command_exists() {
	return $(command -v $1 > /dev/null)
}

if command_exists pipx; then eval "$(register-python-argcomplete3 pipx)"; fi

if command_exists uv; then eval "$(uv generate-shell-completion bash)"; fi
if command_exists uvx; then eval "$(uvx --generate-shell-completion bash)"; fi

if command_exists kubectl; then source <(kubectl completion bash); fi

unset command_exists

