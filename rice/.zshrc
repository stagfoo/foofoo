# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
MAILCHECK=0

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="stagfoo"
plugins=(git zshmarks asdf)
source $ZSH/oh-my-zsh.sh


# Source configuration files

ZSH_CONFIG_DIR="$HOME/.zshrc.d"

if [ -d "$ZSH_CONFIG_DIR" ]; then
  for file in $ZSH_CONFIG_DIR/*.sh; do
    source "$file"
  done
fi