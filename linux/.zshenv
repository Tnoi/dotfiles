# default apps
export TERMINAL=kitty
export EDITOR=vim
export VISUAL=code
export BROWSER=google-chrome-stable

# default folders
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CONFIG_DIR=${XDG_CONFIG_DIR:-/etc/xdg}
export XDG_DATA_DIRS=${XDG_DATA_DIRS:-$XDG_DATA_HOME:/usr/local/share:/usr/share}
export XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:-$HOME/Downloads}

export HYPRSHOT_DIR=${HYPRSHOT_DIR:-$HOME/Pictures/Screenshots}

# pistol
export PISTOL_CHROMA_FORMATTER=terminal
export PISTOL_CHROMA_STYLE=onedark

# extend PATH
export PATH="$PATH:${$(find $HOME/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# bitwarden
export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock

export ZDOTDIR=~/.config/zsh
source -- "$ZDOTDIR"/.zshenv
