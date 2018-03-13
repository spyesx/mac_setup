# Mac Setup

## SSH

```bash
# Check SSH status
sudo systemsetup -getremotelogin

# Enable SSH
sudo systemsetup -setremotelogin on
```

## macOS upgrade

```bash
sudo sh -c “softwareupdate -ia && reboot”
```
The reboot will happen if the first command succeeds. If it fails the reboot won’t happen and you’ll be able to see the errors. Wraps both commands into a mini shell script, with a single sudo, so there’s no second sudo to possibly time out.

## Mac App Store

[mas-cli](https://github.com/mas-cli/mas) is the Mac App Store Command Line Interface to install apps from the App Store.

```bash
# Install
brew install mas

# Sign in Mac App Store with an Apple ID
mas signin email@email.com
```

## Homebrew

Install XCode

```bash
# install
xcode-select --install

# agree
sudo xcrun cc
```

Install Homebrew

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

brew update; brew upgrade; brew prune; brew cleanup; brew doctor
```


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

# Change location of screenshots
defaults write com.apple.screencapture location ${HOME}/Pictures/_screenshots

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

## Backup and restore

### macOS Keychain

Folder to import : ``/Users/spyesx/Library/Keychains/``

SCP Command

```bash
scp spyesx@IP_ADDRESS:/Users/spyesx/Library/Keychains/ /Users/spyesx/Library/
```

### macOS Wifi

File to import : ``/Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist``

```bash
# Download the file
scp spyesx@IP_ADDRESS:/Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist /Users/spyesx/Desktop

# Need to use root privileges
sudo su -

# Keep the old preferences just in case
cd /Library/Preferences/SystemConfiguration
mv com.apple.airport.preferences.plist com.apple.airport.preferences.plist-old

# Install wifi settings
cp /Users/spyesx/Desktop/com.apple.airport.preferences.plist ./
chowm root:wheel com.apple.airport.preferences.plist
```

Reboot or simply relaunch Finder to use your new settings.

### Filezilla

Folder to import : ``/Users/spyesx/.filezilla``

SCP Comamnd

```bash
scp spyesx@IP_ADDRESS:/Users/spyesx/.filezilla/ /Users/spyesx/
```

## Desktop

```bash
mas 'Slack', id: 803453959
mas 'Sip', id: 507257563 
mas 'Todoist', id: 585829637
```

### Install desktop CLI tools

```bash
brew install \
wget \
ssh-copy-id \
git \
tor \
caskroom/cask/brew-cask

brew untap caskroom/cask/
brew install caskroom/cask/xquartz
brew install Caskroom/cask/synergy

```
### Install fonts & beta versions

```bash
# add support for fonts
brew tap caskroom/fonts

# add dev/beta versions
brew tap caskroom/versions

```
### Install apps

* [Smooth Cursor](https://smoothcursor.com/)

```bash
brew cask install \
android-file-transfer \
appcleaner \
cheatsheet \
dropbox \
google-chrome \
google-chrome-canary \
firefox \
flux \
spectacle \
sublime-text \
vlc \
magicprefs \
slack \
tunnelblick \
libreoffice \
macdown \
unrarx \
magicprefs \
evernote \
spotify \
cleanmymac \
synergy \
whatsapp
```

#### Plugins

Quick look plugins

* [QLColorCode](https://github.com/n8gray/QLColorCode)
* [qlstephen](https://github.com/whomwah/qlstephen)
* [qlmarkdown](https://github.com/toland/qlmarkdown)
* [quicklook-json](http://www.sagtau.com/quicklookjson.html)
* [qlprettypatch](https://github.com/atnan/QLPrettyPatch)
* [quicklook-csv](https://github.com/p2/quicklook-csv)
* [webpquicklook](https://github.com/dchest/webp-quicklook)

```bash
brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    webpquicklook
```

Restart QuickLook if needed

```bash
qlmanage -r
```

### Install advanced tools

```bash
brew install \
wine \
winetricks \
youtube-dl \
yujitach-menumeters \
caskroom/cask/veracrypt \
rsync 
```

```bash
winetricks directplay
```

```bash
# Microsoft Remote Desktop 10
mas install 1295203466
```

#### Security

* [Growler](https://github.com/pirate/security-growler)
* [Keeweb](https://keeweb.info/)
* [MacPass](https://github.com/MacPass/MacPass/releases)
* [GPGSuite](https://gpgtools.org/gpgsuite.html)
* [Keybase](https://keybase.io/)
* [Muzzle](https://muzzleapp.com/)
* [Loading](http://bonzaiapps.com/en/loading/)
* [OverSight](https://objective-see.com/products/oversight.html)

##### TOR

```bash
brew install \
tor \
caskroom/cask/torbrowser

```

Start Tor & set network proxy settings automatically. [Source](https://kremalicious.com/simple-tor-setup-on-mac-os-x/)

```bash
# See ./tor/tor_and_sock_proxy.sh

chmod + x tor_and_sock_proxy.sh

tor_and_sock_proxy.sh

```

##### Why is my host name wrong at the Terminal prompt when connected to a public WiFi network?

Type in Terminal:

`scutil --get HostName`

If there's no HostName available, what you see is probably coming from the DNS or DHCP server.

Set your HostName with:

`sudo scutil --set HostName 'mbp-spyesx'`

That should do it. In short, the Mac will pick up a host name from the DHCP server. This does not affect your computer's name as you have assigned it. This will only affect what you see at the command prompt.

## Development

### Web development apps

```bash

brew cask install \
dash \
sourcetree \
sublime-text \
atom \
brackets \
filezilla \
bittorrent \
audacity \
caskroom/cask/virtualbox 
```

#### Web server packages

```bash
brew install \
dnsmasq \
mysql \
node \
memcached \
libmemcached
```

### GIT

```bash
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

```bash
npm install -g bower dploy imagemin npm-check-updates vtop nativefier
```

```bash
cd ~/Desktop
nativefier -n "Google Calendar" --icon "./google-calendar.png" "https://calendar.google.com"
nativefier -n "Google Keep" --icon "./google-keep.png" "https://keep.google.com"
nativefier -n "Time is" --icon "./time-is.png" "https://time.is/compare"
```

### Apache

I don't use Apache from Apple

```bash
sudo apachectl stop

sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

brew install httpd

sudo brew services start httpd
```

#### Troubleshooting

```bash
# Check to ensure the server is up
ps -aef | grep httpd

# Restart Apache
sudo apachectl -k restart

# Read logs
tail -f /usr/local/var/log/httpd/error_log

```

Use `apachectl` command to control Apache:

```bash
$ sudo apachectl start
$ sudo apachectl stop
$ sudo apachectl -k restart
```

#### Configuration

Config is in ``/usr/local/etc/httpd/httpd.conf``.

``open -e /usr/local/etc/httpd/httpd.conf``

```bash
Listen 80

DocumentRoot /Users/spyesx/www

<Directory /Users/spyesx/www>

AllowOverride All

<IfModule unixd_module>
  User spyesx
  Group staff
</IfModule>

ServerName localhost

LoadModule vhost_alias_module libexec/apache2/mod_vhost_alias.so
LoadModule alias_module lib/httpd/modules/mod_alias.so
LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so
LoadModule php7_module /usr/local/Cellar/php72/7.2.0RC6_9/libexec/apache2/libphp7.so

<IfModule dir_module>
  DirectoryIndex index.html, index.php
</IfModule>

Include /private/etc/apache2/extra/httpd-autoindex.conf

Include /private/etc/apache2/extra/vhost/dev
Include /private/etc/apache2/extra/vhost/default
Include /private/etc/apache2/extra/vhost/local
```

``sudo apachectl -k restart``

```bash
sudo chown -R spyesx:_www /Users/spyesx/www
```

#### VHOSTS

##### default
```bash
<VirtualHost *:80>

  DocumentRoot /Users/spyesx/www

  <Directory />
    Options FollowSymLinks
    AllowOverride None
    Order allow,deny
    allow from all
    Require all granted
  </Directory>

  <Directory /Users/spyesx/www>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    allow from all
    Require all granted
  </Directory>

  LogLevel debug

</VirtualHost>

```

##### .localdev
```bash
<Virtualhost *:80>
    VirtualDocumentRoot "/Users/spyesx/www/%-2+/"
    ServerName vhosts.localdev
    ServerAlias *.localdev
    UseCanonicalName Off
    <Directory "/Users/spyesx/www/*">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
    	allow from all
	Require all granted
    </Directory>
</Virtualhost>
```

``sudo apachectl -k restart``


### PHP

```bash
#switch from SecureTransport
brew reinstall --with-openssl curl

#install php-fpm
brew install php72 \
--with-fpm \
--with-httpd \
--with-mysql \
--with-homebrew-curl \
--with-homebrew-openssl \ 
--without-snmp

#setup daemon
ln -sfv /usr/local/opt/php70/*.plist ~/Library/LaunchAgents && \
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php70.plist

brew install phpmyadmin
```

### MySQL

`` mysql.server start `` & ``mysql.server stop``

Basic configuration to allow for large imports and a couple other miscellaneous configuration changes.

```bash
brew install -v mysql
 
cp -v $(brew --prefix mysql)/support-files/my-default.cnf $(brew --prefix mysql)/my.cnf
 
cat >> $(brew --prefix mysql)/my.cnf <<'EOF'
# Echo & Co. changes
max_allowed_packet = 2G
innodb_file_per_table = 1
EOF
 
sed -i '' 's/^# \(innodb_buffer_pool_size\)/\1/' $(brew --prefix mysql)/my.cnf
```

Start MySQL using OS X's launchd and set it to start on login.

```bash
[ ! -d ~/Library/LaunchAgents ] && mkdir -v ~/Library/LaunchAgents
 
[ -f $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ] && ln -sfv $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
 
[ -e ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist ] && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

Secure installation

```bash
$(brew --prefix mysql)/bin/mysql_secure_installation
```

#### Export/Import all databases from the old mac

##### Export

```bash
cd /Users/spyesx/Desktop/

mysqlcheck -u root -p --auto-repair -c --check --all-databases

mysqldump -u root -p --all-databases > alldb.sql
```

Looking for a way to dump all databases in separate files? Check out my gist [mysql_dump_separate_files.sh](https://gist.github.com/spyesx/9a3bddece8ef65d15df7311b5a9a9e24)

##### Import

```bash
scp spyesx@IP_ADDRESS:/Users/spyesx/Desktop/alldb.sql /Users/spyesx/Desktop/

mysql -u root -p < alldb.sql
```

### DNSMasq

#### Install
```bash
# copy the default configuration file.
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf

# copy the daemon configuration file into place.
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/

# start Dnsmasq automatically.
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
```

#### Configuration
```bash
vi /usr/local/etc/dnsmasq.conf

#Google DNS
server=8.8.8.8 

#.localdev
address=/localdev/127.0.0.1

#Names to use from outside
addn-hosts=/usr/local/etc/dnsmasq.hosts
```

```bash
vi /usr/local/etc/dnsmasq.hosts

xx.xx.xx.xx example.localdev

```

#### Restart & Check

```bash
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

dig testing.testing.one.two.three.dev @127.0.0.1
```

#### macOS Configuration

```bash
sudo mkdir -p /etc/resolver

sudo tee /etc/resolver/dev >/dev/null <<EOF
nameserver 127.0.0.1
EOF
```

#### Tests

```bash
# make sure DNS are not broken.
ping -c 1 www.google.com

# check that .dev names work
ping -c 1 foo.dev
ping -c 1 bar.dev
```


### Bluestack

http://blog.weinto.com/osx/how-to-use-android-apps-on-a-mac

## Communication

* [Signal](https://signal.org/download/)
* [Facebook Messenger](https://github.com/rsms/fb-mac-messenger)
* [WhatsApp](https://github.com/stonesam92/ChitChat)
* [Skype](http://www.skype.com/en/download-skype/skype-for-computer/)

```bash
brew install caskroom/cask/skype
```

* [Slack](https://slack.com/download)

```bash
brew install caskroom/cask/slack
```

* [Twitter](https://itunes.apple.com/en/app/twitter/id409789998?mt=12)

```bash
# Install Twitter
mas install 409789998
```


## Design

* Photoshop
* Illustrator
* Indesign
* Lightroom
* Axure
* Freemind
* [Sketch](https://www.sketchapp.com/)
	* [Runner](http://sketchrunner.com/)
	* [Craft](https://www.invisionapp.com/craft)
	* [Reduce](https://flawlessapp.io/reduce)
	* [Flinto](https://www.flinto.com)
	* [Principle](http://principleformac.com/)
	* [Framer](https://framer.com/)
	* [Content generator](https://github.com/timuric/content-generator-sketch-plugin)
* Omnigraffle

## Sound

* [VirtualDJ](http://www.virtualdj.com/)

## Productivity

* [Network Link Conditioner](https://developer.apple.com/downloads/?name=Hardware%20IO%20Tools%20for%20Xcode%207)
* [Sip Color picker](http://sipapp.io/)
* [Teamviewer](https://www.teamviewer.com/en/download/mac/)
* [Disk Inventory X](http://www.derlien.com/)
* [On the job](https://stuntsoftware.com/onthejob/)
* [Pocket](https://getpocket.com)

```bash
# Install Pocket
mas install 568494494
```

* [Todoist](todoist.com)

```bash
# Install Todoist
mas install 585829637
```

* [Trello](https://itunes.apple.com/app/trello/id1278508951)

```bash
# Install Trello
mas install 1278508951
```



### FS drivers

```bash
brew cask install osxfuse

brew install ntfs-3g
```


