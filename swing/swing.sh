#!/bin/bash

swing() {
    # Show help if -h or --help is passed
    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        cat "${BASH_SOURCE%/*}/help.md"
        return 0
    fi

    local b=$(git branch | fzf | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    if [[ -n "$b" ]]; then
        git checkout "$b" || return
    else
        echo "Monkey didn't swing branches @(o･ｪ･o)@"
    fi
}

