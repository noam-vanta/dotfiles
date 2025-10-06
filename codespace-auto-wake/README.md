# GitHub Codespace Auto-Wake

Automatically wakes your GitHub Codespace every 5 minutes so you don't have to manually SSH in after idle periods.

## What it does

- Runs every 5 minutes while your Mac is on
- Connects to your most recently used codespace via `gh cs ssh` and immediately exits
- Wakes the codespace so Cursor/VS Code can reconnect
- Stops running if it fails (e.g., no network, no codespaces found)

## Requirements

- macOS
- GitHub CLI (`gh`) installed and authenticated
- `jq` installed (`brew install jq`)

## Setup

Run the init script:
```bash
./init.sh
```

When you return to your computer, just reload Cursor/VS Code - the codespace will already be awake.

## Management

**Check status:**
```bash
launchctl list | grep codespace
```

**View logs:**
```bash
tail -f /tmp/codespace-wake.log
```

**Stop it:**
```bash
launchctl bootout gui/$(id -u)/com.codespace.wake
```

**Start it again:**
```bash
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.codespace.wake.plist
```

**Remove completely:**
```bash
launchctl bootout gui/$(id -u)/com.codespace.wake
rm ~/Library/LaunchAgents/com.codespace.wake.plist
rm ~/bin/wakeup-codespace.sh
```

## Troubleshooting

**View detailed status:**
```bash
launchctl print gui/$(id -u)/com.codespace.wake
```

**Watch logs in real-time:**
```bash
tail -f /tmp/codespace-wake.log
```

**Manually trigger a run (for testing):**
```bash
launchctl start com.codespace.wake
```

**Common issues:**

- **"Load failed: 5: Input/output error"** - Agent is already loaded. Unload first:
  ```bash
  launchctl bootout gui/$(id -u)/com.codespace.wake
  ```

- **Nothing in the logs** - Check the PATH in the plist includes where `gh` and `jq` are installed:
  ```bash
  which gh
  which jq
  ```

- **"No codespaces found"** - Make sure you're authenticated with GitHub CLI:
  ```bash
  gh auth status
  gh cs list
  ```

**Force reload after changes:**
```bash
launchctl bootout gui/$(id -u)/com.codespace.wake
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.codespace.wake.plist
```