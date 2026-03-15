#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES=(zsh ghostty starship git)

echo "==> Dotfiles bootstrap starting..."

# 1. Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "==> Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "    Waiting for installation to complete. Re-run this script after it finishes."
    exit 0
else
    echo "==> Xcode Command Line Tools: already installed"
fi

# 2. Homebrew
if ! command -v brew &>/dev/null; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "==> Homebrew: already installed"
fi

# 3. Brew packages
echo "==> Installing Homebrew packages..."
brew install stow starship
brew install --cask ghostty font-jetbrains-mono-nerd-font

# 4. Stow packages
echo "==> Linking dotfiles with stow..."
cd "$DOTFILES_DIR"
stow -v -t ~ "${PACKAGES[@]}"

echo ""
echo "==> Done! Open a new terminal tab to see changes."
