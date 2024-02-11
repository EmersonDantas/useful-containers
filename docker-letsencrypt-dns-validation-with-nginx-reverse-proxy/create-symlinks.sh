#!/bin/bash

# Cria links simbólicos
ln -sf /letsencrypt/etc/letsencrypt/live/emersondantas.eti.br/fullchain.pem /etc/ssl/private/fullchain.pem
ln -sf /letsencrypt/etc/letsencrypt/live/emersondantas.eti.br/privkey.pem /etc/ssl/private/privkey.pem

# Executa o Nginx
exec nginx -g 'daemon off;'
