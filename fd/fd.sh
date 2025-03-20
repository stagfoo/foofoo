#!/bin/bash

fd() {
    # Show help if -h or --help is passed
    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        cat "${BASH_SOURCE%/*}/help.md"
        return 0
    fi

    local search_pattern=$1
    local run_after_cd=$2
    local dir=$(ls | grep "$search_pattern" | fzf)
    if [[ -n "$dir" ]]; then
        cd "$dir"
        if [[ -n "$run_after_cd" ]]; then
            eval "$run_after_cd"
        fi
    else
        echo "Nothing found (*ﾉωﾉ)"
    fi
}