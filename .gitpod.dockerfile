
FROM gitpod/workspace-full

USER root

RUN a2dismod mpm_event

RUN apt-get update && apt-get -y install apache2 mysql-server php-curl php-gd php-mbstring php-xml php-xmlrpc

RUN echo "include \${GITPOD_REPO_ROOT}/gitpod_config/apache/apache.conf" > /etc/apache2/apache2.conf
RUN echo ". \${GITPOD_REPO_ROOT}/gitpod_config/apache/envvars" > /etc/apache2/envvars

RUN echo "!include \${GITPOD_REPO_ROOT}/gitpod_config/mysql/mysql.cnf" > /etc/mysql/my.cnf

RUN mkdir /var/run/mysqld
RUN chown gitpod:gitpod /var/run/apache2 /var/lock/apache2 /var/run/mysqld

RUN addgroup gitpod www-data

# RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz
# RUN tar xvzf /workspace/wordpress-hello/phpMyAdmin-4.9.1-english.tar.gz
# RUN mv phpMyAdmin-4.9.1-english phpmyadmin


# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN sudo mv wp-cli.phar /usr/local/bin/wp
