# PHP

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