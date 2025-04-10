# foopass - KeePassXC Password Manager Integration

A simple shell script that integrates with KeePassXC to quickly find and copy passwords using fuzzy search.

## Installation

1. Make sure you have the required dependencies installed:
   ```bash
   # On macOS
   brew install fzf keepassxc

   # On Fedora
   sudo dnf install fzf keepassxc
   ```

2. Configure your KeePassXC database paths:
   - Edit the script to set `kpKeyPath` to your KeePassXC database file path
   - Edit the script to set `kpDBPath` to your KeePassXC key file path
   - Create an entry list file at `~/XXXXXXXX/entrylist.txt` containing your KeePassXC entry names

    example entrylist.txt using /FOLDER/ENTRY
   ```
    /websites/github
   ```

3. Make the script executable:
   ```bash
   chmod +x foopass.sh
   ```

## Usage

```bash
./foopass.sh
```

The script will:
1. Display a fuzzy search interface with your KeePassXC entries
2. Allow you to select an entry
3. Automatically copy the password to your clipboard

## Notes
- Uses `fzf` for interactive entry selection
- Uses `keepassxc-cli` to access KeePassXC database
- Automatically copies selected password to clipboard
- Requires KeePassXC database and key file to be configured
- Entry list must be maintained in `~/XXXXXXXX/entrylist.txt`