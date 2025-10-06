#!/bin/bash

set -e  # Exit on any error

echo "Setting up GitHub Codespace auto-wake..."

# Create bin directory if it doesn't exist
mkdir -p ~/bin

# Update username in plist and copy to LaunchAgents
sed "s/YOUR_USERNAME/$USER/g" com.codespace.wake.plist > ~/Library/LaunchAgents/com.codespace.wake.plist

# Copy and make script executable
cp wake-codespace.sh ~/bin/
chmod +x ~/bin/wake-codespace.sh

# Load the launch agent
launchctl load ~/Library/LaunchAgents/com.codespace.wake.plist

echo "✓ Setup complete!"
echo "Check logs with: tail -f /tmp/code  space-wake.log"
echo "Check status with: launchctl list | grep codespace"