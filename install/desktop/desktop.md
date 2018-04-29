## Desktop

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

```
sudo scutil --set ComputerName "mbp-spyesx" && \
sudo scutil --set HostName "mbp-spyesx" && \
sudo scutil --set LocalHostName "mbp-spyesx" && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "mbp-spyesx"
```

That should do it. In short, the Mac will pick up a host name from the DHCP server. This does not affect your computer's name as you have assigned it. This will only affect what you see at the command prompt.
