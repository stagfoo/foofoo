#!/bin/sh

# these are backwards
kpKeyPath=PATH_TO_DB_FILE.kdbx
kpDBPath=PATH_TO_KEY_FILE.keyx
entry=$(cat ~/PATH_TO_ENTRY_LIST.txt | fzf)

keepassxc-cli show $kpKeyPath -k $kpDBPath $entry -a password | pbcopy
