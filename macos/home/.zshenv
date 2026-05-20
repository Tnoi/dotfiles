export PATH=$PATH:$HOME/.local/bin

test

export SHELL_SESSIONS_DISABLE=1
export HOMEBREW_NO_ANALYTICS=1

export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock

export ZDOTDIR=~/.config/zsh

source -- "$ZDOTDIR"/.zshenv
