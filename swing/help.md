# Swing @(o･ｪ･o)@

A friendly git branch switcher using fuzzy finder (fzf).

## Prerequisites

- git
- fzf (fuzzy finder)

## Installation

1. Make sure you have `fzf` installed:
   ```bash
   # On macOS
   brew install fzf

   # On Ubuntu/Debian
   sudo apt install fzf

   # On Fedora
   sudo dnf install fzf
   ```

2. Add the swing function to your shell configuration (`.bashrc`, `.zshrc`, etc.)

## Usage

Simply type:

```
$ swing

````

This will:
1. Show an interactive list of all your git branches
2. Let you search through them using fuzzy finding
3. Switch to the selected branch when you press Enter

## Features

- Fuzzy search through all branches
- Interactive branch selection
- Simple, memorable command
- Friendly error messages

## Tips

- Type parts of the branch name to filter the list
- Use arrow keys or ctrl-p/ctrl-n to navigate
- Press Esc to cancel without switching branches

## Example

```bash
$ swing
main
feature/new-design
> fix/issue-123
development
release/v2.0

```