FROM php:8.0-apache

RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        zip \
        libpq-dev \
        libicu-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libssl-dev \
        openssl \
        libcurl4-gnutls-dev \
        libxml2-dev \
        curl \
        unzip

RUN docker-php-ext-install pdo pdo_mysql mysqli zip gd intl opcache curl xml

COPY . /var/www/html/

RUN a2enmod rewrite

ENV MYSQL_HOST your-mysql-host
ENV MYSQL_DATABASE your-database-name
ENV MYSQL_USER your-mysql-user
ENV MYSQL_PASSWORD your-mysql-password

EXPOSE 80 3306

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
