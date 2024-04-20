FROM ubuntu:22.04

RUN apt-get update
RUN apt-get -y install certbot
RUN apt-get -y install curl
RUN apt-get -y install python3-certbot-dns-cloudflare

# читаем переменные среды из .env
ARG DOMAIN_EMAIL
ARG DOMAIN_URL
ARG SUB_DOMAIN_URL

# устанавливаем переменные среды в переменные
ENV DOMAIN_EMAIL=$DOMAIN_EMAIL
ENV DOMAIN_URL=$DOMAIN_URL
ENV SUB_DOMAIN_URL=$SUB_DOMAIN_URL

WORKDIR /certbot
COPY . /certbot

RUN chmod +x /certbot/*.sh

EXPOSE 6000 80

# запускаем скрипт генерации
CMD ["sh", "generate-certificate.sh"]
