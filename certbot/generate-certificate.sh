#!/bin/bash
# generate-certificate.sh

# Cloudflare Only
certbot certonly --renew-with-new-domains --dns-cloudflare --dns-cloudflare-credentials ./cloudflare.ini -d $DOMAIN_URL --email $DOMAIN_EMAIL --preferred-challenges dns-01 --non-interactive -v --agree-tos

# копируем сертификаты из образа certbot в папку Nginx
cp /etc/letsencrypt/live/*/fullchain.pem /etc/nginx/root-cert/cert.pem
cp /etc/letsencrypt/live/*/privkey.pem /etc/nginx/root-cert/key.pem

# Cloudflare Only (для поддомена, т.к. почему-то example.com конфликтует с *.lt.example.com)
certbot certonly --renew-with-new-domains --dns-cloudflare --dns-cloudflare-credentials ./cloudflare.ini -d $SUB_DOMAIN_URL --email $DOMAIN_EMAIL --preferred-challenges dns-01 --non-interactive -v --agree-tos

# копируем сертификаты из образа certbot в папку Nginx
cp /etc/letsencrypt/live/*/fullchain.pem /etc/nginx/sub-cert/cert.pem
cp /etc/letsencrypt/live/*/privkey.pem /etc/nginx/sub-cert/key.pem