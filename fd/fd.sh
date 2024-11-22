#!/bin/bash

fd() {
    # Show help if -h or --help is passed
    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        cat "${BASH_SOURCE%/*}/help.md"
        return 0
    fi

    local search_pattern=$1
    local dir=$(ls | grep "$search_pattern" | fzf)
    if [[ -n "$dir" ]]; then
        cd "$dir" || return
    else
        echo "Nothing found (*ﾉωﾉ)"
    fi
}
