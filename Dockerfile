FROM hhvm/hhvm-proxygen:latest

RUN apt-get update -y && apt-get install -y curl
# Install composer
RUN mkdir /opt/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/opt/composer

RUN rm -rf /var/www
ADD . /var/www
RUN cd /var/www && hhvm /opt/composer/composer.phar install

WORKDIR /var/www

RUN composer install --no-dev

#ADD . /root
#RUN sudo chmod +x /root/start.sh

#ADD hhvm.hdf /etc/hhvm/server.hdf
#ADD nginx.conf /etc/nginx/sites-available/hack.conf
#RUN sudo ln -s /etc/nginx/sites-available/hack.conf /etc/nginx/sites-enabled/hack.conf

EXPOSE 8080
