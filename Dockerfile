#syntax=docker/dockerfile:1.4

# Base FrankenPHP image
FROM dunglas/frankenphp:1-php8.3

WORKDIR /app

# persistent / runtime deps
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
	acl \
	file \
	gettext \
	git \
	&& rm -rf /var/lib/apt/lists/*

RUN set -eux; \
	install-php-extensions \
		@composer \
		apcu \
		intl \
		opcache \
		zip \
    	gd \
        pdo_pgsql \
	;

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1




