FROM dunglas/frankenphp:latest-php8.2-alpine

RUN install-php-extensions \
    pdo \
    pdo_mysql \
    opcache \
    intl

RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini && \
    sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/' $PHP_INI_DIR/php.ini && \
    sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 32M/' $PHP_INI_DIR/php.ini && \
    sed -i 's/post_max_size = 8M/post_max_size = 32M/' $PHP_INI_DIR/php.ini && \
    echo opcache.jit_buffer_size=100M >> $PHP_INI_DIR/php.ini && \
    sed -i 's/opcache\.validate_timestamps=1/opcache.validate_timestamps=0/' $PHP_INI_DIR/php.ini

COPY Caddyfile /etc/caddy/Caddyfile

COPY . /app/

COPY .env.docker /app/.env.local

RUN  php /app/bin/console cache:clear -e prod