# Install a web development environment

1. [GIT]()
2. [Node]()
3. [Apache]()
3. [PHP]()
3. [MySQL]()













#### Web server packages

```bash
brew install \
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

