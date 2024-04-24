#!/bin/bash
# generate-certificate.sh

# Cloudflare Only
certbot certonly --renew-with-new-domains --dns-cloudflare --dns-cloudflare-credentials ./cloudflare.ini -d $DOMAIN_URL --email $DOMAIN_EMAIL --preferred-challenges dns-01 --non-interactive -v --agree-tos

# # копируем сертификаты из образа certbot в папку Nginx
cp /etc/letsencrypt/live/*/fullchain.pem /etc/nginx/root-cert/cert.pem
cp /etc/letsencrypt/live/*/privkey.pem /etc/nginx/root-cert/key.pem

# # копипастим следующий абзац столько раз, сколько * доменов нам нужно (меняем -d значение)

# # ждём, пока dns восстановится после предыдущей генерации
echo "wait for 60 seconds"
sleep 60
certbot certonly --renew-with-new-domains --dns-cloudflare --dns-cloudflare-credentials ./cloudflare.ini -d $SUB_DOMAIN_URL --email $DOMAIN_EMAIL --preferred-challenges dns-01 --non-interactive -v --agree-tos
cp /etc/letsencrypt/live/*/fullchain.pem /etc/nginx/sub-cert/cert.pem
cp /etc/letsencrypt/live/*/privkey.pem /etc/nginx/sub-cert/key.pem

# # ждём, пока dns восстановится после предыдущей генерации
echo "wait for 60 seconds"
sleep 60
certbot certonly --renew-with-new-domains --dns-cloudflare --dns-cloudflare-credentials ./cloudflare.ini -d bunl.criitch.ru -d *.bunl.criitch.ru --email $DOMAIN_EMAIL --preferred-challenges dns-01 --non-interactive -v --agree-tos
cp /etc/letsencrypt/live/*/fullchain.pem /etc/nginx/bunl-cert/cert.pem
cp /etc/letsencrypt/live/*/privkey.pem /etc/nginx/bunl-cert/key.pem