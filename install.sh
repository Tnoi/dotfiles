#!/bin/bash

echo "----- Starting macOS setup -----"

set -euo pipefail
sudo -v

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

csrutil status

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
brew install grep
brew install git

brew install eza
brew install fd
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

brew cleanup

# setup zsh4humans
echo "Installing zsh4humans..."
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

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

# manual setup
echo "Manual setup steps:"
echo "1. Set up Raycast"
echo "2. Set up Visual Studio Code"
echo "3. Set up Bitwarden ssh-agent"
echo "4. Set up SSH authorized_keys"

echo "----- Finished macOS setup -----"
