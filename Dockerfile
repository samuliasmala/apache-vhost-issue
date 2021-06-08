FROM ubuntu:18.04

# Update Apache to the latest version (2.4.46)
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/apache2
RUN apt-get update
RUN apt-get install -y apache2

# Disable default site
RUN a2dissite 000-default

# Enable two new sites
COPY ./alpha.conf /etc/apache2/sites-available
COPY ./beta.conf /etc/apache2/sites-available
RUN a2ensite alpha
RUN a2ensite beta

CMD apachectl -D FOREGROUND
