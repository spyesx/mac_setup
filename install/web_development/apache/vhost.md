# VHOSTs

Thanks to dnsMask and the `vhost.localdev` VHOST installed you just need to create a directory in `/Users/spyesx/www/` to have a VHOST up a running.

**Example:**

Let's create the directory `/Users/spyesx/www/spyesx`.

Then we can access it on `http://spyesx.localdev` and `https://spyesx.localdev`.

Note that the HTTPS uses a global self signed SSL certificate. Therefore, your browser will alert 
you regarding a possible lack of security. On a development environment it might be alright but if you need a full trusted self signed ssl certificate you should create a dedicated VHOST with [proper SSL certificate](ssl.md).

## Managing VHOSTs

I use a scripts to create basic VHOSTs faster. Be advised that the creation is only for HTTP. 
You'll have to create VHOSTs for HTTPS on your own.

```bash
cd /usr/local/bin

wget -O a2ensite https://xxx/a2ensite.sh
chmod +x a2ensite

wget -O a2dissite https://xxx/a2dissite.sh
chmod +x a2dissite

wget -O virtualhost https://xxx/.sh
chmod +x virtualhost
```

Usage

```bash
sudo virtualhost [create | delete] [domain] [optional host_dir]
```

### Create VHOST

```bash
sudo virtualhost create newsite.localdev
```

### Delete a VHOST

```bash
sudo virtualhost delete newsite.localdev
```

### Manually enable a VHOST

```bash
a2ensite newsite.localdev
```

### Manually disable a VHOST

```bash
a2dissite newsite.localdev
```


## Load all enabled VHOSTs

Add this line at the end of `/usr/local/etc/httpd/httpd.conf`

```bash
Include /usr/local/etc/httpd/extra/vhost/sites-enabled/*.conf
```

## Restart Apache

``sudo apachectl -k restart``