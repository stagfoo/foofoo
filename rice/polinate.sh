#!/bin/bash

# Exit on error
set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks
echo "Creating symlinks..."

# Zsh
echo "Setting up zsh symlinks..."
ln -sf "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"

# Zsh config directory
echo "Setting up zshrc.d symlinks..."
ln -sf "$SCRIPT_DIR/.zshrc.d" "$HOME/.zshrc.d"

# Tmux
echo "Setting up tmux symlinks..."
ln -sf "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"



echo "Symlinks created successfully!"
