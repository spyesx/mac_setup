# Desktop

## Install desktop CLI tools

```bash
brew install \
wget \
git \
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

## Install apps

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

## Plugins

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

### Bluestack

<http://blog.weinto.com/osx/how-to-use-android-apps-on-a-mac>

## Communication

* [Signal](https://signal.org/download/)
* [Facebook Messenger](https://github.com/rsms/fb-mac-messenger)
* [WhatsApp](https://github.com/stonesam92/ChitChat)
* [Skype](http://www.skype.com/en/download-skype/skype-for-computer/)

```bash
# Install Skype
brew install caskroom/cask/skype
```

* [Slack](https://slack.com/download)

```bash
# Install Slack
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

* [Menu World Time](https://apps.apple.com/us/app/menu-world-time/id1446377255)

```console
# Install Menu World Time
$ mas install 1446377255
>
```

## Create local apps for websites

Node and [Nativefier](https://github.com/jiahaog/nativefier) are required.

```bash
brew install node
npm install nativefier -g
```

```bash
cd ~/Downloads
nativefier -n "Google Calendar" --icon "./nativefier/google-calendar.png" "https://calendar.google.com"
nativefier -n "Google Keep" --icon "./nativefier/google-keep.png" "https://keep.google.com"
nativefier -n "Time is" --icon "./nativefier/time.is.png" "https://time.is/compare"
```
