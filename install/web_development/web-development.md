

#### Web server packages

```bash
brew install \
dnsmasq \
node \
mysql \
memcached \
libmemcached
```

### GIT

```bash
ssh-keygen -t rsa -C "nicolas.bages@weinto.com"

#copy ssh key to clipboard for adding to github.com
pbcopy < ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name "Nicolas Bages" && \
git config --global user.email "spyesx@gmail.com" && \
git config --global github.user spyesx && \
git config --global core.editor "subl -w" && \
git config --global color.ui true && \
git config --global push.default simple

#token
git config --global github.token [your_token_here]

```

### Node

```bash
npm install -g bower dploy imagemin npm-check-updates vtop nativefier
```

```bash
cd ~/Desktop
nativefier -n "Google Calendar" --icon "./google-calendar.png" "https://calendar.google.com"
nativefier -n "Google Keep" --icon "./google-keep.png" "https://keep.google.com"
nativefier -n "Time is" --icon "./time-is.png" "https://time.is/compare"
```

### Apache

I don't use Apache from Apple

```bash
sudo apachectl stop

sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

brew install httpd

sudo brew services start httpd
```

#### Troubleshooting

```bash
# Check to ensure the server is up
ps -aef | grep httpd

# Restart Apache
sudo apachectl -k restart

# Read logs
tail -f /usr/local/var/log/httpd/error_log

```

Use `apachectl` command to control Apache:

```bash
$ sudo apachectl start
$ sudo apachectl stop
$ sudo apachectl -k restart
```

#### Configuration

Config is in ``/usr/local/etc/httpd/httpd.conf``.

``open -e /usr/local/etc/httpd/httpd.conf``

```bash
Listen 80

DocumentRoot /Users/spyesx/www

<Directory /Users/spyesx/www>

AllowOverride All

<IfModule unixd_module>
  User spyesx
  Group staff
</IfModule>

ServerName localhost

LoadModule vhost_alias_module libexec/apache2/mod_vhost_alias.so
LoadModule alias_module lib/httpd/modules/mod_alias.so
LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so
LoadModule php7_module /usr/local/Cellar/php72/7.2.0RC6_9/libexec/apache2/libphp7.so

<IfModule dir_module>
  DirectoryIndex index.html, index.php
</IfModule>

Include /private/etc/apache2/extra/httpd-autoindex.conf

Include /private/etc/apache2/extra/vhost/dev
Include /private/etc/apache2/extra/vhost/default
Include /private/etc/apache2/extra/vhost/local
```

``sudo apachectl -k restart``

```bash
sudo chown -R spyesx:_www /Users/spyesx/www
```

#### VHOSTS

##### default
```bash
<VirtualHost *:80>

  DocumentRoot /Users/spyesx/www

  <Directory />
    Options FollowSymLinks
    AllowOverride None
    Order allow,deny
    allow from all
    Require all granted
  </Directory>

  <Directory /Users/spyesx/www>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    allow from all
    Require all granted
  </Directory>

  LogLevel debug

</VirtualHost>

```

##### .localdev
```bash
<Virtualhost *:80>
    VirtualDocumentRoot "/Users/spyesx/www/%-2+/"
    ServerName vhosts.localdev
    ServerAlias *.localdev
    UseCanonicalName Off
    <Directory "/Users/spyesx/www/*">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
    	allow from all
	Require all granted
    </Directory>
</Virtualhost>
```

``sudo apachectl -k restart``


### PHP

```bash
#switch from SecureTransport
brew reinstall --with-openssl curl

#install php-fpm
brew install php72 \
--with-fpm \
--with-httpd \
--with-mysql \
--with-homebrew-curl \
--with-homebrew-openssl \ 
--without-snmp

#setup daemon
ln -sfv /usr/local/opt/php70/*.plist ~/Library/LaunchAgents && \
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php70.plist

brew install phpmyadmin
```

### MySQL

`` mysql.server start `` & ``mysql.server stop``

Basic configuration to allow for large imports and a couple other miscellaneous configuration changes.

```bash
brew cask install sequel-pro
brew install -v mysql
 
cp -v $(brew --prefix mysql)/support-files/my-default.cnf $(brew --prefix mysql)/my.cnf
 
cat >> $(brew --prefix mysql)/my.cnf <<'EOF'
# Echo & Co. changes
max_allowed_packet = 2G
innodb_file_per_table = 1
EOF
 
sed -i '' 's/^# \(innodb_buffer_pool_size\)/\1/' $(brew --prefix mysql)/my.cnf
```

Start MySQL using OS X's launchd and set it to start on login.

```bash
[ ! -d ~/Library/LaunchAgents ] && mkdir -v ~/Library/LaunchAgents
 
[ -f $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ] && ln -sfv $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
 
[ -e ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist ] && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

Secure installation

```bash
$(brew --prefix mysql)/bin/mysql_secure_installation
```

#### Export/Import all databases from the old mac

##### Export

```bash
cd /Users/spyesx/Desktop/

mysqlcheck -u root -p --auto-repair -c --check --all-databases

mysqldump -u root -p --all-databases > alldb.sql
```

Looking for a way to dump all databases in separate files? Check out my gist [mysql_dump_separate_files.sh](https://gist.github.com/spyesx/9a3bddece8ef65d15df7311b5a9a9e24)

##### Import

```bash
scp spyesx@IP_ADDRESS:/Users/spyesx/Desktop/alldb.sql /Users/spyesx/Desktop/

mysql -u root -p < alldb.sql
```

### DNSMasq

#### Install
```bash
# copy the default configuration file.
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf

# copy the daemon configuration file into place.
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/

# start Dnsmasq automatically.
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
```

#### Configuration
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

#### Restart & Check

```bash
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

dig testing.testing.one.two.three.dev @127.0.0.1
```

#### macOS Configuration

```bash
sudo mkdir -p /etc/resolver

sudo tee /etc/resolver/dev >/dev/null <<EOF
nameserver 127.0.0.1
EOF
```

#### Tests

```bash
# make sure DNS are not broken.
ping -c 1 www.google.com

# check that .dev names work
ping -c 1 foo.dev
ping -c 1 bar.dev
```
