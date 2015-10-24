# Mac Setup

## OSX Preferences

```
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

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

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

```

## Dev

dnsmasq : http://passingcuriosity.com/2013/dnsmasq-dev-osx/

### Homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

XCode
```
# install
xcode-select --install

# agree
sudo xcrun cc
```

```
wget \
ssh-copy-id \
git \
caskroom/cask/brew-cask
```

#### Web server packages

```
brew install \
dnsmasq \
apache \
mysql \
phpmyadmin \
node \
memcached \
libmemcached \
```

```
brew install homebrew/php/phpmyadmin
```

#### Cask Apps

```
# add support for fonts
brew tap caskroom/fonts

# add dev/beta versions
brew tap caskroom/versions

brew cask install \
alfred \
android-file-transfer \
appcleaner \
cheatsheet \
dropbox \
google-chrome \
google-drive \
google-hangouts \
flux \
spectacle \
sublime-text \
vlc \
magicprefs \
dash \
sourcetree \
atom \
brackets \
slack \
tunnelblick \
filezilla \

```

### GIT

```
ssh-keygen -t rsa -C "nicolas.bages@weinto.com"

#copy ssh key to clipboard for adding to github.com
pbcopy < ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name "Nicolas Bages" && \
git config --global user.email "spyesx@gmail.com" && \
git config --global github.user spyesx && \
git config --global core.editor "subl -w" && \
git config --global color.ui true && \
git config --global push.default simple

#token
git config --global github.token [your_token_here]

```

### Node

```
npm install -g bower dploy grunt grunt-cli grunt-devtools gulp imagemin npm-check-updates vtop
```

### PHP

```
#switch from SecureTransport
brew reinstall --with-openssl curl

#install php-fpm
brew tap homebrew/dupes && \
brew tap homebrew/versions && \
brew tap homebrew/dupes && \
brew install php70 \
--with-fpm \
--without-apache \
--with-mysql \
--with-homebrew-curl \
--with-homebrew-openssl \ 
--without-snmp

#setup daemon
ln -sfv /usr/local/opt/php70/*.plist ~/Library/LaunchAgents && \
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php70.plist
````


## Communication

Skype
Messenger
WhatsApp
Slack
Twitter

BlueStack

## Design

* Photoshop
* Illustrator
* Indesign
* Lightroom
* Axure
* Freemind
* Sketch : https://www.sketchapp.com/
* Omnigraffle


Audacity
VirtualDJ

Bitorrent
TunnelBlick


Chrome
Chrome Canary
Firefox

Pocket
Spotify
VLC
Renammer


On the job



Nitro
Android File Transfert
Clean My Mac
iTweaX

LibreOffice
MacDown
Macaw
Mou
UnRarX


MagicPref
Spectacle
Smoothcursor
MenuMeters
MondoMouse
Network Link Conditioner


