#!/bin/bash

# @DEPRECARED - certbot authenticator для reg.ru, он не работает, т.к. судя по всему DNS reg.ru слишком медленно обновляется

#Основные параметры
TXT_DOMAIN="example.com"
TXT_SUBDOMAIN="_acme-challenge"

CERBU=USER_EMAIL
CERBP=USER_PASSWORD

#Параметры для удаления текущих записей
TXT_DELETE="input_format=json&input_data={\"username\":\"$CERBU\",\"password\":\"$CERBP\",\"domains\":[{\"dname\":\"$TXT_DOMAIN\"}],\"subdomain\":\"$TXT_SUBDOMAIN\",\"record_type\":\"TXT\",\"output_content_type\":\"plain\"}"

#Параметры для добавления записи
TXT_ADD="input_format=json&input_data={\"username\":\"$CERBU\",\"password\":\"$CERBP\",\"domains\":[{\"dname\":\"$TXT_DOMAIN\"}],\"subdomain\":\"$TXT_SUBDOMAIN\",\"text\":\"$CERTBOT_VALIDATION\",\"output_content_type\":\"plain\"}"

#Можно проверить при желении
echo -e "DELETE: $TXT_DELETE\n\n"
echo -e "ADD: $TXT_ADD\n\n"

#Запрос на удаление
curl -X GET -d "$TXT_DELETE" "https://api.reg.ru/api/regru2/zone/remove_record"
#Запрос на создание
curl -X GET -d "$TXT_ADD" "https://api.reg.ru/api/regru2/zone/add_txt"

#Немного времени, чтобы DNS обновились
sleep 25
