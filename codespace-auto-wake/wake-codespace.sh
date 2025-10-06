#!/bin/bash

# Log to file for debugging
exec > /tmp/codespace-wake.log 2>&1

echo "$(date): Starting codespace wake"

# Get the first (most recent) codespace name
CODESPACE=$(gh cs list --json name,lastUsedAt | jq -r 'sort_by(.lastUsedAt) | reverse | .[0].name')

if [ -z "$CODESPACE" ]; then
    echo "$(date): No codespaces found"
    exit 1
fi

echo "$(date): Waking up codespace: $CODESPACE"

# SSH in and immediately exit - this wakes the codespace
gh cs ssh -c "$CODESPACE" -- exit

echo "$(date): Codespace is awake"