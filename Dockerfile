FROM ubuntu:latest
MAINTAINER D Clinton info@bootstrap-it.com
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y apache2
ADD index.html /var/www/html/
CMD /usr/sbin/apache2ctl -D FOREGROUND
EXPOSE 80



# Utilisation de l'image AWS Elastic Beanstalk Python 3.4
# FROM amazon/aws-eb-python:3.4.2-onbuild-3.5.1

# Exposes port 8080
# EXPOSE 8080

# Installation de dependances PostgreSQL
# RUN apt-get update && \
#    apt-get install -y postgresql libpq-dev && \
#    rm -rf /var/lib/apt/lists/*