# mani - Fuzzy npm Script Runner (｡•̀ᴗ-)✧

A friendly npm script selector using fuzzy finder (fzf).

## Prerequisites

- Node.js/npm (with a package.json file)
- fzf (fuzzy finder)
- jq (JSON processor)

## Installation

1. Make sure you have the required tools:
   ```bash
   # On macOS
   brew install fzf jq

   # On Ubuntu/Debian
   sudo apt install fzf jq

   # On Fedora
   sudo dnf install fzf jq
   ```

2. Add the `mani` function to your shell configuration (`.bashrc`, `.zshrc`, etc.)

## Usage

Simply run:

```bash
yarn run $(mani)
# or 
npm run $(mani)

```
