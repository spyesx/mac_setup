# Let's Encrypt 

## Network configuration

## Cryptography

Encrypt RSA 2048 bits signature SHA256

## Installation on a Debian Linux

`apt-get install certbot`

## Register

`certbot register`

### Create a certificate

First use `--staging` to create a test certificate then remove this flag to create a production certificate.

`certbot certonly -n --agree-tos --email 'hosting@weinto.com' --staging --webroot -w /path/to/document/root -d zone.domain.tld`

### Renew a certificate

`cat /etc/cron.d/certbot`

### Remove a certificate

#### Revoke

`certbot revoke --staging --cert-path /etc/letsencrypt/live/zone.domain.tld/cert.pem`

#### Delete

The deletion is required otherwise the certificate (revoked or not) will be automatically renewed by cerbot via its cron task.

`certbot delete --cert-name zone.domain.tld`

### List certificates

`certbot certificates`
