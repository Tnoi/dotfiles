# source files
z4h source $ZDOTDIR/.z4h.zsh

# history configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.local/history/.zsh_history

setopt EXTENDED_HISTORY         # Write the history file in the ':start:elapsed;command' format
setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY            # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS         # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS     # Delete an old recorded event if a new event is a duplicate

# shell options
setopt glob_dots                # no special treatment for file names with a leading dot
setopt no_auto_menu             # require an extra TAB press to open the completion menu

# keybindings
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

z4h bindkey z4h-cd-up      Alt+Up
z4h bindkey z4h-cd-down    Alt+Down

# aliases
alias root='cd /'
alias home='cd $HOME'
alias c='clear'
alias cd='z'
alias lg='lazygit'
alias ls='eza --group-directories-first'
alias ll='eza -l --group-directories-first'
alias la='eza -la --group-directories-first'
alias mkdir='mkdir -p'

# functions
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

source <(fzf --zsh)
eval "$(zoxide init zsh)"

