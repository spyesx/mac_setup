# Network

## Why is my host name wrong at the Terminal prompt when connected to a public WiFi network?

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


## nmap

Scan local network

```bash
brew install nmap

# Show which hosts responded to ping requests on the network between 192.168.1.0 and 192.168.1.255
# use sudo to get MAC addresses
nmap -sn 192.168.1.0/24
```

## Wifi

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

## MAC Spoof

```bash
# Source : https://github.com/feross/spoof
npm install spoof -g

spoof list
spoof list --wifi

spoof randomize wi-fi
spoof set 00:00:00:00:00:00 wi-fi

spoof reset wi-fi
```

## Wake-on-lan

```bash
brew install wakeonlan

wakeonelan <MAC_ADDRESS>
```

## DNS top

```bash
brew install dnstop

dnstop en0
```

## BMON

```bash
brew install bmon

bmon
```
