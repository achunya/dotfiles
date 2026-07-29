#!/usr/bin/env bash

# Copy live configs back into repository
cp -rfT "$HOME/.config/nvim"   "$HOME/dotfiles/nvim"
cp -rfT "$HOME/.config/niri"   "$HOME/dotfiles/niri"
cp -rfT "$HOME/.config/waybar" "$HOME/dotfiles/waybar"
cp -rfT "$HOME/.config/rofi"   "$HOME/dotfiles/rofi"
cp -rfT "$HOME/.config/zellij" "$HOME/dotfiles/zellij"

cp -f "$HOME/.vimrc"   "$HOME/dotfiles/vim/.vimrc"
cp -f "$HOME/.bashrc"  "$HOME/dotfiles/bash/.bashrc"

# Push to remote repository
cd "$HOME/dotfiles"
git add .
git commit -m "Update configs"
git push
