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

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock show-recents -float 0
defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock expose-group-apps -int 0
killall Dock

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

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
brew install fd
brew install fzf
brew install exiftool
brew install eza
brew install zoxide
brew install stow

brew install shellcheck
brew install shfmt

brew install python

brew install neovim
brew install lazygit
brew install yazi

echo "Installing Homebrew cask applications..."
brew install --cask raycast
brew install --cask brave-browser
brew install --cask ghostty
brew install --cask visual-studio-code
brew install --cask bitwarden
brew install --cask obsidian
brew install --cask vlc
brew install --cask font-fira-code-nerd-font

brew cleanup

# clone dotfiles repository
if [[ ! -d "$HOME/dotfiles" ]]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/Tnoi/dotfiles.git "$HOME/.dotfiles"
else
    echo "Dotfiles repository already exists. Pulling latest changes..."
    cd "$HOME/.dotfiles" && git pull
fi

# stow dotfiles
echo "Stowing dotfiles..."
cd "$HOME/.dotfiles" || exit

stow -R -t "$HOME" ghostty home nvim raycast wallpapers yazi zsh

# setup zsh4humans
echo "Installing zsh4humans..."
if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
    sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

# manual setup
echo "Manual setup steps:"
echo "1. Set up zsh files"
echo "2. Set up Raycast"
echo "3. Set up Visual Studio Code"
echo "4. Set up Bitwarden"
echo "5. Set up Brave Browser"

echo "----- Finished macOS setup -----"
