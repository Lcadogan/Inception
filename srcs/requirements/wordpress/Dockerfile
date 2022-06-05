FROM alpine:3.14

ARG DATABASE
ARG USER
ARG PASSWORD
ARG HOSTNAME

RUN apk update && \
    apk add --no-cache \
    php-curl \
    php-fpm \
    php-gd \
    php-json \
    php-mbstring \
    php-mysqli \
    php-zlib \
    wget

RUN wget --quiet https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz > /dev/null && \
    rm -rf latest.tar.gz && \
    mv wordpress/ /var/wordpress && \
    \
    cd /var/wordpress && \
    sed -e "s/database_name_here/$DATABASE/" \
        -e "s/username_here/$USER/" \
        -e "s/password_here/$PASSWORD/" \
        -e "s/localhost/$HOSTNAME/" \
        wp-config-sample.php > wp-config.php && \
    \
    sed -i "s/127.0.0.1/0.0.0.0/" \
    /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm7", "--nodaemonize"]
