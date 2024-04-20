criitch.ru

## Requirements

- ubuntu:20.04
- domain (e.g. example.com)
- dns (cloudflare) resolves this VPS

## Download

```sh
git pull git@github.com:crutch12/criitch.ru.git
cd ./criitch.ru
```

## Install dependencies

```sh
$ sudo sh install.sh
```

## Generate certificate (certbot)

Setup:
- create ./certbot/.env (from ./cerbot/.env.example)
- create ./certbot/cloudflare.ini (from ./certbot/cloudflare.ini.example)

Run
```sh
$ cd ./certbot
$ docker compose up certbot --build
```

## Run nginx (and other services)

```sh
$ docker compose up -d
```

Recreate
```sh
$ docker compose up -d --force-recreate
```