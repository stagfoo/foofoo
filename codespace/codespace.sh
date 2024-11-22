#!/bin/zsh

# Function to display help message
show_help() {
    SCRIPT_DIR=${0:a:h}  # Get the directory containing this script
    cat "$SCRIPT_DIR/help.md" || {
        echo "❌ Error: help.md not found in script directory"
        exit 1
    }
    exit 0
}

# Check for help flags
[[ "$1" == "-h" || "$1" == "--help" ]] && show_help

# Define the search directory as the current directory
SEARCH_DIR=$(pwd)

# Function to open regular directory
open_directory() {
    echo "⚠️ Opening directory instead... (；´д｀)ゞ"
    code . > /dev/null 2>&1
}

# Check if the .vscode directory exists and contains a workspace file
if [ -d "$SEARCH_DIR/.vscode" ] && workspace_file=$(find "$SEARCH_DIR/.vscode" -name "*.code-workspace" -print -quit); then
    echo "✨ Opening workspace ╰( ´︶\` )╯ ✨"
    code "$workspace_file" > /dev/null 2>&1
else
    open_directory
fi

