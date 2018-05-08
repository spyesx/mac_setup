# Useful commands



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



