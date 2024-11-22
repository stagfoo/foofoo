#!/bin/zsh

# Configuration
DEFAULT_WORK=25    # Default work duration in minutes
DEFAULT_BREAK=5    # Default break duration in minutes
DEFAULT_ROUNDS=4   # Default number of rounds before long break
DEFAULT_LONG_BREAK=15  # Default long break duration in minutes

# Emojis and colors
work_emoji="💼"
break_emoji="☕️"
start_emoji="🔔"
done_emoji="✅"
long_break_emoji="🌴"
pause_emoji="⏸️"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Help message
show_help() {
    cat << EOF
${GREEN}Pomodoro Timer${NC}

Usage: pomo [OPTIONS]
Options:
    -w, --work TIME     Set work duration in minutes (default: $DEFAULT_WORK)
    -b, --break TIME    Set break duration in minutes (default: $DEFAULT_BREAK)
    -l, --long TIME     Set long break duration in minutes (default: $DEFAULT_LONG_BREAK)
    -r, --rounds NUM    Set number of rounds before long break (default: $DEFAULT_ROUNDS)
    -h, --help         Show this help message
    -q, --quiet        Disable notification sounds
    -n, --no-notify    Disable desktop notifications

Controls:
    Space    - Pause/Resume
    q        - Quit
    s        - Skip current interval
EOF
    exit 0
}

# Parse command line arguments
work_duration=$((DEFAULT_WORK * 60))
break_duration=$((DEFAULT_BREAK * 60))
long_break_duration=$((DEFAULT_LONG_BREAK * 60))
rounds=$DEFAULT_ROUNDS
QUIET=false
NOTIFY=true

while [[ $# -gt 0 ]]; do
    case $1 in
        -w|--work) work_duration=$(($2 * 60)); shift 2 ;;
        -b|--break) break_duration=$(($2 * 60)); shift 2 ;;
        -l|--long) long_break_duration=$(($2 * 60)); shift 2 ;;
        -r|--rounds) rounds=$2; shift 2 ;;
        -h|--help) show_help ;;
        -q|--quiet) QUIET=true; shift ;;
        -n|--no-notify) NOTIFY=false; shift ;;
        *) echo "Unknown option: $1"; show_help ;;
    esac
done

# Function to send desktop notification
notify() {
    if [ "$NOTIFY" = true ]; then
        if command -v osascript &> /dev/null; then
            osascript -e "display notification \"$1\" with title \"Pomodoro Timer\""
        elif command -v notify-send &> /dev/null; then
            notify-send "Pomodoro Timer" "$1"
        fi
    fi
}

# Function to play sound
play_sound() {
    if [ "$QUIET" = false ]; then
        if command -v afplay &> /dev/null; then
            afplay /System/Library/Sounds/Glass.aiff &
        elif command -v paplay &> /dev/null; then
            paplay /usr/share/sounds/freedesktop/stereo/complete.oga &
        fi
    fi
}

# Function to handle user input
handle_input() {
    local char
    read -t 0.1 -k 1 char 2>/dev/null
}

# Function to display a loading bar
loading_bar() {
    local duration=$1
    local interval=1
    local elapsed=0
    local bar_length=50

    while ((elapsed < duration)); do
        local progress=$((elapsed * bar_length / duration))
        local bar=$(printf '=%.0s' {1..$progress})
        printf "\r[%-*s] %02d:%02d" $bar_length "$bar" $(( (duration - elapsed) / 60 )) $(( (duration - elapsed) % 60 ))
        sleep $interval
        ((elapsed++))
    done
    echo ""
}

# Pomodoro timer function
pomo() {
    echo -e "$start_emoji Starting Pomodoro timer..."
    while true; do
        echo -e "$work_emoji Time to work!"
        loading_bar $work_duration
        
        echo -e "$break_emoji Time for a break!"
        loading_bar $break_duration
        
        echo -e "$done_emoji Break over. Let's get back to work!"
    done
}
