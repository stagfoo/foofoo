#!/bin/bash

# Check if the ports file is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <ports_file>"
  exit 1
fi

# File containing the list of services and ports to check
PORTS_FILE="$1"

# Check if the file exists
if [ ! -f "$PORTS_FILE" ]; then
  echo "Error: File '$PORTS_FILE' not found."
  exit 1
fi

# Get all open ports once
OPEN_PORTS=$(lsof -i -P -n | grep LISTEN)

# Array to hold the table rows
TABLE_ROWS=()

# Read the ports file and build the table rows
while IFS='=' read -r SERVICE PORT; do
  # Trim any leading/trailing whitespace
  SERVICE=$(echo "$SERVICE" | xargs)
  PORT=$(echo "$PORT" | xargs)

  # Check if the port is in the list of open ports
  if echo "$OPEN_PORTS" | grep -q ":$PORT "; then
    STATUS="🚫"
  else
    STATUS="✅"
  fi

  # Store the formatted row with Service column last
  TABLE_ROWS+=("$(printf "%-10s | %-7s | %-20s" "$PORT" "$STATUS" "$SERVICE")")
done < "$PORTS_FILE"

# Print the table header and rows
printf "\n%-10s | %-6s | %-20s\n" "Port" "Status" "Service"
printf "%-10s | %-6s | %-20s\n" "----------" "------" "--------------------"

# Print the rows
for ROW in "${TABLE_ROWS[@]}"; do
  echo "$ROW"
done

printf "\n"

