#!/bin/zsh

# Read input and extract command
input=$(cat)
command=$(echo "$input" | grep -o 'git push --set-upstream origin [^"]*')
current_branch=$(git branch --show-current)

# Protected branches
protected_branches=(main master production staging develop)

# Check if branch is protected
is_protected() {
    [[ " ${protected_branches[@]} " =~ " ${1} " ]]
}

# Main logic
if [[ -n "$command" && ! $(is_protected "$current_branch") ]]; then
    echo "Swimming up stream 🌊🐟 : $command"
    eval "$command"
elif $(is_protected "$current_branch"); then
    echo "( ╯°□°)╯ ┻━━┻  Not pushing to protected branch '$current_branch'!"
else
    echo "( ╯°□°)╯ ┻━━┻  No git push command found in the input."
fi
