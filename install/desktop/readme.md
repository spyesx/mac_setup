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

http://blog.weinto.com/osx/how-to-use-android-apps-on-a-mac

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

Record sound from the mycrophone

```bash
sox -d recording.wav
```

## Productivity

* [Network Link Conditioner](https://developer.apple.com/downloads/?name=Hardware%20IO%20Tools%20for%20Xcode%207), limit your bandwidth.
* [Teamviewer](https://www.teamviewer.com/en/download/mac/), control computers remotely.
* [Disk Inventory X](http://www.derlien.com/), list what's on your disk.
* [On the job](https://stuntsoftware.com/onthejob/), timesheets.
* [Pocket](https://getpocket.com), read it later.
* [Numi](https://numi.io/), multi purpose calculator.
* [Moom](https://manytricks.com/moom/), screen layouts for macOS.

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

### Working with calendars & Timezones

I used to work with Time.is but I've found 2 useful CLI tools since then.

#### cal

`cal` displays a calendar.

```bash
cal -y
```

```
➜  ~ cal -y     
                            2018
      January               February               March          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
    1  2  3  4  5  6               1  2  3               1  2  3  
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   4  5  6  7  8  9 10  
14 15 16 17 18 19 20  11 12 13 14 15 16 17  11 12 13 14 15 16 17  
21 22 23 24 25 26 27  18 19 20 21 22 23 24  18 19 20 21 22 23 24  
28 29 30 31           25 26 27 28           25 26 27 28 29 30 31  
                                                                  

       April                  May                   June          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
 1  2  3  4  5  6  7         1  2  3  4  5                  1  2  
 8  9 10 11 12 13 14   6  7  8  9 10 11 12   3  4  5  6  7  8  9  
15 16 17 18 19 20 21  13 14 15 16 17 18 19  10 11 12 13 14 15 16  
22 23 24 25 26 27 28  20 21 22 23 24 25 26  17 18 19 20 21 22 23  
29 30                 27 28 29 30 31        24 25 26 27 28 29 30  
                                                                  

        July                 August              September        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
 1  2  3  4  5  6  7            1  2  3  4                     1  
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   2  3  4  5  6  7  8  
15 16 17 18 19 20 21  12 13 14 15 16 17 18   9 10 11 12 13 14 15  
22 23 24 25 26 27 28  19 20 21 22 23 24 25  16 17 18 19 20 21 22  
29 30 31              26 27 28 29 30 31     23 24 25 26 27 28 29  
                                            30                    

      October               November              December        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
    1  2  3  4  5  6               1  2  3                     1  
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   2  3  4  5  6  7  8  
14 15 16 17 18 19 20  11 12 13 14 15 16 17   9 10 11 12 13 14 15  
21 22 23 24 25 26 27  18 19 20 21 22 23 24  16 17 18 19 20 21 22  
28 29 30 31           25 26 27 28 29 30     23 24 25 26 27 28 29  
                                            30 31           
```

#### Overtile-cli

`overtime` makes it easy to show time-overlap tables for remote teams.

```bash
npm install -g overtime-cli
```

```
➜  ~ overtime show America/Montreal@Laurie Europe/Paris@JC Asia/Hong_Kong@Nico
$ 
┌────────────┬────────────┬────────────┐
│ Laurie     │ JC         │ Nico       │
├────────────┼────────────┼────────────┤
│  12:00 AM  │  6:00 AM   │  12:00 PM  │
├────────────┼────────────┼────────────┤
│  1:00 AM   │  7:00 AM   │  1:00 PM   │
├────────────┼────────────┼────────────┤
│  2:00 AM   │  8:00 AM   │  2:00 PM   │
├────────────┼────────────┼────────────┤
[...]
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
