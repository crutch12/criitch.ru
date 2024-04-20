#!/bin/bash
# generate-certificate.sh

# Cloudflare Only
certbot certonly --dns-cloudflare --dns-cloudflare-credentials ./cloudflare.ini -d $DOMAIN_URL --email $DOMAIN_EMAIL --preferred-challenges dns-01 --non-interactive -v --agree-tos

# копируем сертификаты из образа certbot в папку Nginx
cp /etc/letsencrypt/live/*/fullchain.pem /etc/nginx/cert.pem
cp /etc/letsencrypt/live/*/privkey.pem /etc/nginx/key.pem
