FROM php:fpm

RUN apt-get update && apt-get install -y locales libpng12-dev libjpeg-dev git curl wget libmagickwand-dev --no-install-recommends \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd pdo_mysql zip opcache \
    
    && curl -sS https://getcomposer.org/installer | php -d detect_unicode=Off \
    && chmod a+x composer.phar && mv composer.phar /usr/local/bin/composer \
    && composer self-update \

    && rm -rf /var/lib/apt/lists/* \
    && rm installer