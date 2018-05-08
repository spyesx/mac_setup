
# DNSMasq

## Installation

```bash
brew install dnsmasq
```

## Preparation

Copy the default configuration file.

```bash
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf
```

Copy the daemon configuration file into place.

```bash
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
```

Start Dnsmasq automatically.

```bash
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
```

## Configuration

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

## Restart & Check

```bash
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

dig testing.testing.one.two.three.localdev @127.0.0.1
```

#### macOS Configuration

```bash
sudo mkdir -p /etc/resolver

sudo tee /etc/resolver/localdev >/dev/null <<EOF
nameserver 127.0.0.1
EOF
```

#### Tests

```bash
# make sure DNS are not broken.
ping -c 1 www.google.com

# check that .dev names work
ping -c 1 foo.localdev
ping -c 1 bar.localdev
```
