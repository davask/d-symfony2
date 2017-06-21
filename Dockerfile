FROM davask/d-php-letsencrypt:7.0-a2.4-d8.8
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.app.framework="Symfony"

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; php composer-setup.php; php -r "unlink('composer-setup.php');"; mv composer.phar /usr/local/bin/composer;

RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony; chmod a+x /usr/local/bin/symfony; rm -rdf /dwl/default/var/www/html; symfony new /dwl/default/var/www/symfony 2.8 mv /dwl/default/var/www/symfony /dwl/default/var/www/html

COPY ./build/dwl/php.sh ./build/dwl/get-symfony-app.sh ./build/dwl/prepare-symfony-app.sh ./build/dwl/fix-symfony-permissions.sh ./build/dwl/init.sh
/dwl/
USER admin

