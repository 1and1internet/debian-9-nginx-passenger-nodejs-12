FROM 1and1internet/debian-9-nginx-passenger
MAINTAINER brian.wilkinson@fasthosts.co.uk
ARG DEBIAN_FRONTEND=noninteractive
COPY files /
RUN apt-get update -q \
	&& apt-get install -y curl \
	&& curl -sL https://deb.nodesource.com/setup_12.x | bash - \
	&& apt-get install -y nodejs \
	&& sed -i 's|wsgi;|node;\n        passenger_startup_file app.js;|' /etc/nginx/sites-enabled/default \
	&& /usr/bin/passenger-config validate-install  --auto --no-colors \
	&& apt-get -y clean \
	&& rm -rf /var/lib/apt/lists/*
