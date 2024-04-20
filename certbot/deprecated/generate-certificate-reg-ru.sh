#!/bin/bash
# @DEPRECATED
# generate-certificate.sh

certbot certonly --manual --preferred-challenges=dns --manual-auth-hook ./authenticator.sh -d $DOMAIN_URL --email=criitch@yandex.ru --server https://acme-v02.api.letsencrypt.org/directory --agree-tos --non-interactive --manual-public-ip-logging-ok -v

# копируем сертификаты из образа certbot в папку Nginx
cp /etc/letsencrypt/live/certfolder*/fullchain.pem /etc/nginx/cert.pem
cp /etc/letsencrypt/live/certfolder*/privkey.pem /etc/nginx/key.pem


