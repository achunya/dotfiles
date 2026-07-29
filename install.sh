#!/usr/bin/env bash

# Terminate execution immediately on command failure
set -e

# Target directory initialization
mkdir -p "$HOME/.config"

# System synchronization and base toolchain installation
sudo pacman -Syu --needed --noconfirm base-devel git neovim curl

# AUR helper availability check and compilation
if ! command -v paru &> /dev/null; then
    BUILD_DIR=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$BUILD_DIR/paru"
    
    # Compilation and installation executed as non-root user
    (cd "$BUILD_DIR/paru" && makepkg -si --noconfirm)
    
    rm -rf "$BUILD_DIR"
fi

# Batch package installation from manifest file
if [ -f pkglist.txt ]; then
    paru -S --needed --noconfirm $(cat pkglist.txt)
fi

# Neovim plugin manager installation
PLUG_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
if [ ! -f "$PLUG_PATH" ]; then
    curl -fLo "$PLUG_PATH" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Repository path resolution
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Configuration deployment
# -T flag prevents directory nesting on existing targets
[ -d "$DOTFILES_DIR/nvim" ]   && cp -rfT "$DOTFILES_DIR/nvim"   "$HOME/.config/nvim"
[ -d "$DOTFILES_DIR/niri" ]   && cp -rfT "$DOTFILES_DIR/niri"   "$HOME/.config/niri"
[ -d "$DOTFILES_DIR/waybar" ] && cp -rfT "$DOTFILES_DIR/waybar" "$HOME/.config/waybar"
[ -d "$DOTFILES_DIR/rofi" ]   && cp -rfT "$DOTFILES_DIR/rofi"   "$HOME/.config/rofi"
[ -d "$DOTFILES_DIR/zellij" ] && cp -rfT "$DOTFILES_DIR/zellij" "$HOME/.config/zellij"

[ -f "$DOTFILES_DIR/vim/.vimrc" ]   && cp -f "$DOTFILES_DIR/vim/.vimrc"   "$HOME/.vimrc"
[ -f "$DOTFILES_DIR/bash/.bashrc" ] && cp -f "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
