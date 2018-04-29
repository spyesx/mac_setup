## SSH

```bash
# Check SSH status
sudo systemsetup -getremotelogin

# Enable SSH
sudo systemsetup -setremotelogin on

# Show external IP
dig +short myip.opendns.com @resolver1.opendns.com
curl -s https://api.ipify.org && echo
curl ifconfig.me
```

## macOS upgrade

```bash
sudo sh -c “softwareupdate -ia && reboot”
```
The reboot will happen if the first command succeeds. If it fails the reboot won’t happen and you’ll be able to see the errors. Wraps both commands into a mini shell script, with a single sudo, so there’s no second sudo to possibly time out.

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

## Mac App Store

[mas-cli](https://github.com/mas-cli/mas) is the Mac App Store Command Line Interface to install apps from the App Store.

```bash
# Install
brew install mas

# Sign in Mac App Store with an Apple ID
mas signin email@email.com
```