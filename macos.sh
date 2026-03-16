#!/usr/bin/env bash
set -euo pipefail

echo "==> Applying macOS preferences..."

# Tap to click on trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Bottom-right corner click as secondary (right) click
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool false

# Show battery percentage in menu bar
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

echo "==> Done! Some changes may require a logout or restart to take effect."
