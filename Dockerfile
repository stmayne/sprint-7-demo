FROM ubuntu:12.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y apache2
RUN apt-get install git -y

# Install apache and write hello world message
RUN cd /var/www/
RUN git clone https://github.com/stmayne/sprint-7-demo.git /var/www/hello-world-service/
RUN cat /var/www/hello-world-service/index.html

# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
