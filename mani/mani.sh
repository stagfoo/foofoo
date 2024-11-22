#!/bin/zsh

# Exit immediately if a command exits with a non-zero status
set -e

# Function to show error messages with emoji
show_error() {
    echo "（・□・；） $1" >&2
    exit 1
}

# Function to show success messages with emoji
show_success() {
    echo "(｡•̀ᴗ-)✧ $1"
}

# Check for package.json
[[ -f package.json ]] || show_error "No package.json found in this directory"

# Extract scripts using jq and check for errors
scripts=$(jq -r '.scripts | keys[]' package.json) || show_error "Failed to parse package.json"
[[ -n "$scripts" ]] || show_error "No scripts found in the package.json"

# Use fzf to select script
if selected_script=$(echo "$scripts" | fzf --prompt="(⁀ᗢ⁀) Select an npm script: "); then
    show_success "Selected script: $selected_script"
    echo "$selected_script"
else
    show_error "No script selected"
fi

