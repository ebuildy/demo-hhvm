FROM hhvm/hhvm-proxygen:3.30.1

RUN mkdir /opt/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/opt/composer

RUN rm -rf /var/www
ADD . /var/www
RUN cd /var/www && /opt/composer/composer.phar install --no-dev

WORKDIR /var/www

ADD site.ini /etc/hhvm/server.ini

EXPOSE 8080
