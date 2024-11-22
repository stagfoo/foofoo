#!/bin/zsh

# Read folder list from stdin (piped input)
folders=($(cat))

# Loop through each folder from the piped input
for folder in "${folders[@]}"; do
    # Check if the folder exists
    if [ -d "$folder" ]; then
        # Check if the .env file exists in the top level of the folder
        if [ -f "$folder/.env" ]; then
            echo ".env file found in $folder"
        else
            echo "No .env file found in $folder"
        fi
    else
        echo "$folder does not exist"
    fi
done

# usage
# ls | grep 'service' | ./check_env_files.sh
