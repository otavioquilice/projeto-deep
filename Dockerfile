# Use a base image do PHP 8
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y build-essential libpng-dev libjpeg-dev libjpeg62-turbo-dev jpegoptim optipng libfreetype6-dev locales zip pngquant gifsicle vim unzip git curl libpq-dev ffmpeg ruby libzip-dev cron nano systemd netcat-openbsd


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_mysql zip exif pcntl opcache bcmath

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /var/www/html

# Copie os arquivos do seu projeto para o contêiner
COPY . .

# Instale as dependências do Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --ignore-platform-reqs

# Configure cron
RUN echo "SHELL=/bin/sh" > /etc/cron.d/artisan-cron && \
    echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> /etc/cron.d/artisan-cron && \
    echo "* * * * * cd /var/www/html && php artisan schedule:run >> /dev/null 2>&1" >> /etc/cron.d/artisan-cron && \
    chmod 0644 /etc/cron.d/artisan-cron && \
    crontab /etc/cron.d/artisan-cron && \
    touch /var/log/cron.log


# RUN php artisan migrate

# Instale o Node.js (versão 20) e o npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

RUN npm install

RUN npm run build

# Exponha a porta 8000
EXPOSE 8000

# Inicie o servidor PHP
# CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
