criitch.ru

## Requirements

- `ubuntu:20.04`
- domain (e.g. `example.com`)
- dns (**cloudflare**) resolves this VPS

## Download

```sh
git pull git@github.com:crutch12/criitch.ru.git
cd ./criitch.ru
```

## Install dependencies

```sh
$ sudo sh install.sh
```

## CloudFlare DNS

1) https://dash.cloudflare.com/
2) create site
3) change domain dns servers - set Cloudflare Nameservers in your Domain Registrar (e.g. reg.ru)
4) wait up to 24h

see https://developers.cloudflare.com/dns/zone-setups/full-setup/setup/

## Generate certificate (certbot)

Setup:
- create `./certbot/.env` (from `./cerbot/.env.example`)
- create `./certbot/cloudflare.ini` (from `./certbot/cloudflare.ini.example`)

Run
```sh
$ cd ./certbot
$ docker compose up certbot --build
```

### Regenerate certificate every month (cron)

```sh
# update cron
$ crontab -e
```

Add (_replace /path/to/criitch.ru/certbot_)
```
@monthly cd /path/to/criitch.ru/certbot && docker compose up certbot --build
```

## Run nginx (and other services)

```sh
$ docker compose up -d
```

Recreate
```sh
$ docker compose up -d --force-recreate
```