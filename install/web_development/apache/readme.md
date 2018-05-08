# Apache 

## Remove Apache from macOS

I don't use Apache from Apple.

Stop Apache delivered with macOS

```bash
sudo apachectl stop
```

Prevent Apache delivered with macOS to start on boot.

```bash
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

```

## Install Apache from Homebrew

```bash
brew install httpd
```

Start the new Apache

```bash
sudo brew services start httpd
```

## Troubleshooting

Check to ensure the server is up

```bash
ps -aef | grep httpd
```

## Commands

Use `apachectl` command to control Apache:

```bash
$ sudo apachectl start
$ sudo apachectl stop
$ sudo apachectl -k restart
```

Read logs

```bash
tail -f /usr/local/var/log/httpd/error_log
```

## Global configuration

Config is in `/usr/local/etc/httpd/httpd.conf`.

`open -e /usr/local/etc/httpd/httpd.conf`

## DocumentRoot

I use a directory `www` in my home directory so I need to give the permissions to Apache to read it.

```bash
sudo chown -R spyesx:_www /Users/spyesx/www
```

## Virtual Hosts

Please read [vhost](vhost.md) for details.

## SSL

Please read [SSL](ssl.md) for details.

