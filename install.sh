#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

echo "==> Updating system & installing base dependencies..."
sudo pacman -Syu --needed base-devel git stow neovim curl

# Check if paru is already installed
if ! command -v paru &> /dev/null; then
    echo "==> Paru not found. Installing Paru..."
    
    # Create temporary directory for building
    BUILD_DIR=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$BUILD_DIR/paru"
    
    # Build and install paru without root 
    (cd "$BUILD_DIR/paru" && makepkg -si --noconfirm)
    
    # Clean up build files
    rm -rf "$BUILD_DIR"
else
    echo "==> Paru is already installed."
fi

# Installing the packages 
echo "==> Installing packages from list..."
paru -S --needed - < pkglist.txt

echo "==> Installing vim-plug for Neovim..."
PLUG_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
if [ ! -f "$PLUG_PATH" ]; then
    curl -fLo "$PLUG_PATH" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "==> vim-plug installed successfully."
else
    echo "==> vim-plug is already installed."
fi

echo "==> Stowing dotfiles..."
cd "$HOME/dotfiles"
stow */

echo "==> Installing Neovim plugins via vim-plug..."
nvim --headless +PlugInstall +qall

echo "==> Setup complete!"
