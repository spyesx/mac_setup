# SSL

## Install Open SSL if it's not

```bash
brew install openssl
```

## Certificate Authority

Make yourself as a Certificate Authority to auto-sign the SLL certificate.

This gives you the key you will use to sign your certificates.

```bash
openssl genrsa -out rootCA-key.pem 2048
```

This gives you the certificate that you will install on your browser and OS.

```bash
openssl req -x509 -new -nodes -key rootCA-key.pem -sha256 -days 1024 -out rootCA-crt.pem
```

## Trust any certificates signed with that key

Add the file `rootCA-crt.pem` to your trusted certificates. On macOS it will be stored in the Keychain Access.

## Generate your self signed certificates with a SAN field

Example for `spyesx.localdev`

Create the private key for this certificate.

```bash
openssl genrsa -out spyesx.localdev-key.pem 2048
```

Generate the certificate signing request.

```bash
openssl req -new -key spyesx.localdev-key.pem -out spyesx.localdev-crt.pem -subj /CN="spyesx.localdev"
```

Sign the CSR with your CA root key.

```bash
openssl x509 -req -in spyesx.localdev-crt.pem -CA rootCA-crt.pem -CAkey rootCA-key.pem -CAcreateserial -out spyesx.localdev-crt.pem -days 500 -sha256 \
    -extensions SAN \
    -extfile <(cat /private/etc/ssl/openssl.cnf \
        <(printf '[SAN]\nsubjectAltName=DNS:%s' "spyesx.localdev"))
```

## Use the certificate in an Apache VHOST

Example for your VHOST configuration. Note the location of all files. 

```bash

<Virtualhost *:443>
	VirtualDocumentRoot "/Users/spyesx/www/spyesx/"
	ServerName spyesx.localdev
	UseCanonicalName Off
	#Header always set Strict-Transport-Security "max-age=0; includeSubdomains;"
	
	<Directory "/Users/spyesx/www/spyesx">
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
		Require all granted
	</Directory>

	SSLEngine on
	SSLCertificateFile /usr/local/etc/httpd/extra/ssl/spyesx.localdev-crt.pem
	SSLCertificateKeyFile /usr/local/etc/httpd/extra/ssl/spyesx.localdev-key.pem
	SSLCACertificateFile /usr/local/etc/httpd/extra/ssl/rootCA-crt.pem
	SSLProtocol TLSv1.2
	SSLCipherSuite ECDHE+CHACHA20:ECDHE+AESGCM:EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
	SSLHonorCipherOrder on
	SSLCompression off
	SSLStrictSNIVHostCheck on
</Virtualhost>

```
