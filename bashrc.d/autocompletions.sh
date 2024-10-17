if [[ $(type -t uv) == "file" ]]; then eval "$(uv generate-shell-completion bash)"; fi
if [[ $(type -t uvx) == "file" ]]; then eval "$(uvx --generate-shell-completion bash)"; fi

