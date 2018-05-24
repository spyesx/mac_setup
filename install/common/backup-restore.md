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