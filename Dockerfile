
FROM php:8.1-fpm


# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip

WORKDIR /var/www/html

COPY . .


RUN chmod -R 775 storage bootstrap/cache
RUN chown -R www-data:www-data /var/www/html

CMD php artisan serve --host=0.0.0.0 --port=8080