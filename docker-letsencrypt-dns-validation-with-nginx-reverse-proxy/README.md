# Configuração do Docker Compose para SWAG e Nginx Reverse Proxy

Este guia descreve como configurar o SWAG (Secure Web Application Gateway) da LinuxServer.io, que automatiza a emissão e renovação de certificados SSL via Let's Encrypt, juntamente com um Nginx Reverse Proxy em um ambiente Docker.

## Para que serve

O docker-compose facilita a definição e execução de aplicações Docker multi-container. Com o docker-compose, você pode configurar todos os serviços necessários para sua aplicação em um único arquivo e iniciá-los com um único comando. Neste contexto, usamos o docker-compose para configurar e gerenciar tanto o SWAG para a emissão de certificados SSL quanto o Nginx como um proxy reverso.

## Passos para Configuração

### Inicie o Serviço LetsEncrypt:

Inicie o container letsencrypt em modo detached (background) com o comando:

    docker-compose up -d letsencrypt

### Configure o Provedor de DNS:

1 - Localize o arquivo .ini correspondente ao seu provedor de DNS em /config-swag/dns-conf.

2 - Preencha os acessos necessários (API keys, tokens, etc.) no arquivo .ini.

3 - Reinicie o Serviço LetsEncrypt: Após configurar os acessos do seu provedor de DNS, reinicie o serviço letsencrypt para aplicar as alterações:

    docker-compose restart letsencrypt

### Configure o Proxy Reverso:

1 - Altere as configurações de proxy reverso conforme necessário em /config/conf.d/sites-available. Certifique-se de configurar os arquivos de site para apontar para os serviços corretos dentro da sua rede Docker.

2 - Inicie o Serviço Nginx Reverse Proxy: Com as configurações de proxy reverso ajustadas, inicie o container nginx-reverse-proxy em modo detached:

    docker-compose up -d nginx-reverse-proxy

### Compilado dos artigos abaixo:

- https://faun.pub/docker-letsencrypt-dns-validation-75ba8c08a0d
- https://www.freecodecamp.org/portuguese/news/como-configurar-um-proxy-reverso-de-modo-facil-e-seguro-com-docker-nginx-e-letsencrypt/
