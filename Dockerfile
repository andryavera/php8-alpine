# FROM php:7.4.21-apache

# RUN apk update && apk upgrade && apk add bash unzip

# RUN apt-get update && apt-get install -y \
#   unzip

# RUN cd ~ \
#   && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#   && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
#   && php composer-setup.php \
#   && php -r "unlink('composer-setup.php');"

# RUN mv composer.phar /usr/local/bin/composer

# RUN composer global require laravel/installer

# RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

# RUN docker-php-ext-install pdo_mysql mysqli gettext

# RUN a2enmod rewrite

# RUN service apache2 restart





FROM alpine:edge

LABEL maintainer="Heri Andria Herdiana <andryavera@gmail.com>"

RUN apk --update add --no-cache wget \ 
		     curl \
		     git \
		     php8 \
		     php8-curl \
		     php8-openssl \
		     php8-iconv \
		     php8-json \
		     php8-mbstring \
		     php8-phar \
		     php8-dom \
             php8-xml \
             php8-xmlwriter \
             php8-fileinfo \
             php8-tokenizer

RUN curl -sS https://getcomposer.org/installer | php8 -- --install-dir=/usr/bin --filename=composer 

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]