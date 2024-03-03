############################################################
# Dockerfile to build Flask App
############################################################

# Set the base image
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ America/New_York

RUN apt-get update && apt-get install -y apache2 \
    libapache2-mod-wsgi-py3 \
    python3 \
    python3-pip \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/flaskapp

# Copy over and install the requirements
COPY ./ /var/www/flaskapp/
RUN pip install -r /var/www/flaskapp/requirements.txt

# Copy over the apache configuration file and enable the site
COPY ./apache-flask.conf /etc/apache2/sites-enabled/000-default.conf

RUN a2enmod wsgi

# LINK apache config to docker logs.
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

EXPOSE 80

WORKDIR /var/www/flaskapp

CMD  /usr/sbin/apache2ctl -D FOREGROUND
