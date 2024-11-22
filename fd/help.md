# fd - Fuzzy Directory Navigation

A simple shell function that combines `grep` and `fzf` to quickly find and navigate to directories.

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

2. Add the `fd` function to your shell configuration (`.bashrc`, `.zshrc`, etc.)

## Usage

```bash
fd "foo"
# or
fd

```
## Arguments
- `search_pattern`: Text to filter directory names (optional)

## Notes
- Uses `fzf` for interactive directory selection
- Filters directory names using grep
- Returns a cute emoji (ﾉωﾉ) if nothing is found