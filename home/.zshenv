export SHELL_SESSIONS_DISABLE=1
export HOMEBREW_NO_ANALYTICS=1

export EDITOR='nvim'
export VISUAL='code'

export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock

export FZF_DEFAULT_COMMAND='fd'

export CLAUDE_CONFIG_PATH=~/.claude/.claude.json

export ZDOTDIR=~/.config/zsh
source -- "$ZDOTDIR"/.zshenv
