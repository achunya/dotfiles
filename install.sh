#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

echo "==> Updating system & installing base dependencies..."
sudo pacman -Syu --needed base-devel git stow

# Check if paru is already installed
if ! command -v paru &> /dev/null; then
    echo "==> Paru not found. Installing Paru..."
    
    # Create temporary directory for building
    BUILD_DIR=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$BUILD_DIR/paru"
    
    # Build and install paru without root (makepkg fails if run as root)
    (cd "$BUILD_DIR/paru" && makepkg -si --noconfirm)
    
    # Clean up build files
    rm -rf "$BUILD_DIR"
else
    echo "==> Paru is already installed."
fi

# Install remaining packages using paru (handles both official and AUR packages)
echo "==> Installing packages from list..."
paru -S --needed - < pkglist.txt

echo "==> Stowing dotfiles..."
stow */

echo "==> Setup complete!"
