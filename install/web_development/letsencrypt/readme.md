# Let's Encrypt 

## Network configuration

## Cryptography

Encrypt RSA 2048 bits signature SHA256

## Installation on a Debian Linux

```bash
apt-get install certbot
```

## Register

```bash
certbot register
```

### Create a certificate

First use `--staging` to create a test certificate then remove this flag to create a production certificate.

```bash
certbot certonly -n --agree-tos --email 'hosting@weinto.com' --staging --webroot -w /path/to/document/root -d zone.domain.tld
```

### Renew a certificate

```bash
cat /etc/cron.d/certbot
```

### Remove a certificate

#### Revoke

```bash
certbot revoke --staging --cert-path /etc/letsencrypt/live/zone.domain.tld/cert.pem
```

#### Delete

The deletion is required otherwise the certificate (revoked or not) will be automatically renewed by cerbot via its cron task.

```bash
certbot delete --cert-name zone.domain.tld
```

### List certificates

```bash
certbot certificates
```
## Verifications

1. VHost : What is the certificate used?

```bash
grep -i sslcertificatefile /etc/apache2/sites-enabled/zone.domain.tld_ssl.conf 

# SSLCertificateFile /etc/letsencrypt/live/zone.domain.tld/cert.pem
```

2. Check the certificate

```bash
openssl x509 -in /etc/letsencrypt/live/zone.domain.tld/fullchain.pem -noout -text |grep -i issuer

# Issuer: C = US, O = Let's Encrypt, CN = Let's Encrypt Authority X3
```

3. Test the certificate from the web

```bash
openssl s_client -crlf -servername zone.domain.tld -connect zone.domain.tld:443
```

4. Still not good?

Then Apache is not using the conf file you read. So reload Apache `systemctl reload apache2`.
