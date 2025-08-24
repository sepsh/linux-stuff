function command_exists() {
	return $(command -v $1 > /dev/null)
}

if command_exists pipx; then
	if command_exists register-python-argcomplete; then
		eval "$(register-python-argcomplete pipx)";
	elif command_exists register-python-argcomplete3; then
		eval "$(register-python-argcomplete3 pipx)";
	fi
fi

if command_exists uv; then eval "$(uv generate-shell-completion bash)"; fi
if command_exists uvx; then eval "$(uvx --generate-shell-completion bash)"; fi

if command_exists kubectl; then source <(kubectl completion bash); fi

if command_exists kind; then source <(kind completion bash); fi

if command_exists argocd; then source <(argocd completion bash); fi

if command_exists rustup; then source <(rustup completions bash); fi
if command_exists rustup; then source <(rustup completions bash cargo); fi

unset command_exists

