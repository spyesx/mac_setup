# Useful commands

## Network

### nmap

Scan local network

```bash
brew install nmap

# Show which hosts responded to ping requests on the network between 192.168.1.0 and 192.168.1.255
# use sudo to get MAC addresses
nmap -sn 192.168.1.0/24
```

### Wifi

Turn on Wi-Fi Adapter

```bash
networksetup -setairportpower en0 on
```

Scan Available Access Points

```bash
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

airport -s
```

Join a Wi-Fi Network

```bash
networksetup -setairportnetwork en0 WIFI_SSID WIFI_PASSWORD
```

Show current SSID

```bash
airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
```

Get local IP address

```bash
ifconfig en0 | grep inet
```
Set local IP addresses

```bash
sudo ipconfig set en0 DHCP

sudo ifconfig en0 [IP] netmask [MASK]

sudo route add default gw [GW] eth0

networksetup -setdnsservers en0 [dns1] [dns2]
```

### MAC Spoof

```bash
# Source : https://github.com/feross/spoof
npm install spoof -g

spoof list
spoof list --wifi

spoof randomize wi-fi
spoof set 00:00:00:00:00:00 wi-fi

spoof reset wi-fi
```

### Screen

Share a terminal session with another user: [Source](http://wiki.networksecuritytoolkit.org/index.php/HowTo_Share_A_Terminal_Session_Using_Screen)

Sets up a shared screen session named shared

```
screen -d -m -S shared
```
Shows what screen sessions you currently have running

```
screen -ls
```

Attach to a existing screen session named shared

```
screen -x shared
```

Detach a screen `ctrl+a` `d`

Kill a screen `ctrl+a` `k`

Share a screen with another user

```
# Reattach a session and if necessary detach it first
screen -r shared

# Allow multiuser
ctrl+a :multiuser on

# Add a user
ctrl+a :acladd user2

```

Attach to a multiuser shared screen

```
screen -x user1/shared
```

### SSHFS

Install SSHFS if it's not.

```
brew install sshfs
```

Mount a volume in a folder you've created.

```
mkdir -p ~/mount/[VOLUME_NAME]

sshfs user@host:/path/to/open/ ~/mount/[VOLUME_NAME] -ovolname=VOLUME_NAME
```

## Security

Lock Screen

```bash
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
```

Securely Remove File & Folder

```bash
srm /path/to/file
srm -r /path/to/folder/
```

## System


Current folder elements sizes

```
du -sh -- * .*
```

Compare Two Folders

```bash
diff -qr /path/to/folder1 /path/to/folder2
```

Copy data to Clipboard

```bash
cat whatever.txt | pbcopy
```

Write data from Clipboard

```bash
pbpaste > whatever.txt
```

Set Login Window Text

```bash
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your text"
```

Purge memory cache

```bash
sudo purge
```

Notification Center Service

```bash
#Disable
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && \
killall -9 NotificationCenter

#Enable (Default)
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
```

Root User

```bash
#Enable
dsenableroot

#Disable
dsenableroot -d
```

Total awesomeness! List all the commands you could run.

```bash
compgen -ac | grep cat
```

```bash
# will list all the commands you could run.
compgen -c

# will list all the aliases you could run.
compgen -a

# will list all the built-ins you could run.
compgen -b

# will list all the keywords you could run.
compgen -k

# function will list all the functions you could run.
compgen -A

# function -abck will list all the above in one go.
compgen -A
```



