# Mac Setup

## OSX Preferences

```bash
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

# Disable Chrome's two-finger back/forward navigation
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

```

### OSX Keychain

Folder to import : ``/Users/spyesx/Library/Keychains/``

SCP Command

```bash
scp spyesx@IP_ADDRESS:/Users/spyesx/Library/Keychains/ /Users/spyesx/Library/
```

### OSX Wifi

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

## Dev

### Homebrew

XCode
```bash
# install
xcode-select --install

# agree
sudo xcrun cc
```

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

brew doctor
```

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

#### Web server packages


```bash
brew install \
dnsmasq \
mysql \
node \
memcached \
libmemcached \
wine \
winetricks \
youtube-dl
```

```bash
winetricks directplay
```

#### Cask Apps

```bash
# add support for fonts
brew tap caskroom/fonts

# add dev/beta versions
brew tap caskroom/versions

brew cask install \
android-file-transfer \
appcleaner \
cheatsheet \
dropbox \
google-chrome \
google-chrome-canary \
google-drive \
google-hangouts \
firefox \
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
bittorrent \
spotify \
audacity \
libreoffice \
macdown \
unrarx \
itweax \
magicprefs \
evernote \
yujitach-menumeters \
cleanmymac \
synergy \
whatsapp
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
npm install -g bower dploy grunt grunt-cli grunt-devtools gulp imagemin npm-check-updates vtop nativefier
```

```bash
cd ~/Desktop
nativefier -n "Google Calendar" "https://calendar.google.com"
```

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


### Apache

I don't use Apache from Apple

```bash
sudo apachectl stop

sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

brew install httpd

sudo brew services start httpd
```

Config is in ``/usr/local/etc/httpd/httpd.conf``.

``open -e /usr/local/etc/httpd/httpd.conf``

``sudo apachectl -k restart``

```bash
sudo chown -R spyesx:_www /Users/spyesx/www
```

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

##### dev
```bash
<Virtualhost *:80>
    VirtualDocumentRoot "/Users/spyesx/www/%-2+/"
    ServerName vhosts.dev
    ServerAlias *.dev
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

``sudo apachectl restart``

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

#.dev
address=/dev/127.0.0.1

#Names to use from outside
addn-hosts=/usr/local/etc/dnsmasq.hosts
```

```bash
vi /usr/local/etc/dnsmasq.hosts

xx.xx.xx.xx example.dev

```

#### Restart & Check

```bash
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

dig testing.testing.one.two.three.dev @127.0.0.1
```

#### OSX Configuration

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

* [Skype](http://www.skype.com/en/download-skype/skype-for-computer/) 
* [Facebook Messenger](https://github.com/rsms/fb-mac-messenger)
* [WhatsApp](https://github.com/stonesam92/ChitChat)
* [Slack](https://slack.com/download)
* [Twitter](https://itunes.apple.com/en/app/twitter/id409789998?mt=12)

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

## Tools
* [Pocket](https://getpocket.com)
* [On the job](https://stuntsoftware.com/onthejob/)
* [Todoist](todoist.com)
* [Network Link Conditioner](https://developer.apple.com/downloads/?name=Hardware%20IO%20Tools%20for%20Xcode%207)
* [Sip Color picker](http://sipapp.io/)
* [Teamviewer](https://www.teamviewer.com/en/download/mac/)
* [Disk Inventory X](http://www.derlien.com/)
* [Trello](https://itunes.apple.com/app/trello/id1278508951)

