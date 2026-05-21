#!/bin/bash

set -euo pipefail

echo "----- Starting macOS setup -----"

# install xCode Command Line Tools
if ([[ "$(uname -s)" == "Darwin" ]] && ! xcode-select -p &>/dev/null); then
    echo "Installing xCode Command Line Tools..."
    xcode-select --install
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    echo "xCode Command Line Tools installed."
else
    echo "xCode Command Line Tools already installed."
fi

# setup macOS system preferences
echo "Setting up macOS system preferences..."

defaults write com.apple.dock autohide-delay -float 0.025
defaults write com.apple.dock expose-group-apps -float 0.025
defaults write com.apple.dock show-recents -float 0
defaults write com.apple.dock trash-full -float 0
killall Dock

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

csrutil status

echo "macOS system preferences setup complete."

# setup Hombrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

brew analytics off
brew update

echo "Installing Homebrew packages..."
brew install coreutils
brew install eza
brew install fd
brew install git
brew install stow
brew install neovim

echo "Installing Homebrew cask applications..."
brew install --cask raycast
brew install --cask google-chrome
brew install --cask ghostty
brew install --cask visual-studio-code
brew install --cask bitwarden
brew install --cask vlc
brew install --cask font-fira-code

echo "Homebrew setup complete."

# clone dotfiles repository
if [[ ! -d "$HOME/dotfiles" ]]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/Tnoi/dotfiles.git "$HOME/dotfiles"
else
    echo "Dotfiles repository already exists. Pulling latest changes..."
    cd "$HOME/dotfiles" && git pull
fi

# stow dotfiles
echo "Stowing dotfiles..."
cd "$HOME/dotfiles" || exit

stow -R -t $HOME ghostty nvim zsh home

echo "----- Finished macOS setup -----"
