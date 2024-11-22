# foofoo
I collection of zsh/go scripts to help developer develop


## Tools

- [dango](https://github.com/stagfoo/dango) - A simple task runner
- [gwiz](https://github.com/stagfoo/gwiz) - Git workflow helper
- [fd](./fd) - Fast directory switcher
- [upstream](./upstream) - Git upstream branch helper
- [check_env_files](./check_env_files) - Environment file validator
- [swing](./swing) - Project switcher and manager
- [mani](./mani) - Manifest file generator
- [codespace](./codespace) - VS Code workspace manager

## Installation

```bash
# Add these to your ~/.zshrc

# Get the path to the FOOFOO directory
export FOOFOO="$HOME/path/to/FOOFOO"  # Change this to your actual path

# Tool aliases
alias fd="$FOOFOO/fd/fd"
alias upstream="$FOOFOO/upstream/upstream"
alias check_env_files="$FOOFOO/check_env_files/check_env_files"
alias swing="$FOOFOO/swing/swing"
alias mani="$FOOFOO/mani/mani"
alias codespace="$FOOFOO/codespace/codespace"
```