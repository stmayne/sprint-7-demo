FROM ubuntu:12.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y apache2
RUN apt-get install git -y

# Install apache and write hello world message
RUN mkdir /var/www/hello-world-service/
RUN cd /var/www/hello-world-service/
RUN git clone https://github.com/stmayne/sprint-7-demo.git
RUN mv sprint-7-demo/* . 

# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
