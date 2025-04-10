export GPG_TTY=$(tty)

# Android
export ANDROID_HOME=/Users/al/Library/Android/sdk
export ANDROID_NDK_HOME="/Users/al/Library/Android/sdk/ndk/21.4.7075529"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Go
export PATH=$PATH:~/go/bin

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v"17");

# Curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/al/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# OpenJDK
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# Move Lazygit into config
export XDG_CONFIG_HOME="$HOME/.config"

# Rust
source $HOME/.cargo/env