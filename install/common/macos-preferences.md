## macOS Preferences

### Force iCloud logout

```bash
defaults delete MobileMeAccounts
```

### Disable “Correct spelling automatically”

`Keyboard` ▶︎ `Text` ▶︎ `Disable “Correct spelling automatically”`

```bash
defaults read -g NSAutomaticSpellingCorrectionEnabled
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
```

### Enable FileVault

`Security and Privacy` ▶︎ `FileVault` ▶︎ `On` (makes sure SSD is securely encrypted)

```bash
fdesetup status
sudo fdesetup enable
```

### Enable firewall

`Security and Privacy` ▶︎ `Firewall` ▶︎ `On`

```bash
# Enable firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Unload firewall
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist

# Load firewall
sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist
```

### UI preferences

* Security and Privacy ▶︎ General ▶︎ App Store and identified developers
* File Sharing ▶︎ Off
* Users & Groups > Login Items > Spectacle, Flux

### CLI preferences

```bash

# Set audio volume
osascript -e 'set volume 4'

# Set microphone volume
sudo osascript -e "set volume input volume 80"

# Disable Sudden Motion Sensor. (Why would we keep it on a SSD?)
sudo pmset -a sms 0

# Change location of screenshots
mkdir ${HOME}/Pictures/_screenshots
defaults write com.apple.screencapture location ${HOME}/Pictures/_screenshots
killall SystemUIServer

# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Disable window animations ("new window" scale effect)
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Turn on dashboard-as-space
defaults write com.apple.dashboard enabled-state 2

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable ext change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes and USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show absolute path in finder's title bar. 
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

# Enable AirDrop over Ethernet and on unsupported Macs
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Disable Chrome's two-finger back/forward navigation
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

```