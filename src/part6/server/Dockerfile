FROM debian:latest
WORKDIR /home/

# Устанавливаем необходимые пакеты
RUN apt update  \
    && apt install -y nginx  \
    && apt install -y gcc  \
    && apt install -y libfcgi-dev  \
    && apt install -y spawn-fcgi  \
    && rm -rf /var/lib/apt/lists/*

# Копируем конфиг и исходники
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server/server.c .
COPY ./start.sh .

# Делаем скрипт исполнимым
RUN chmod +x ./start.sh

# Создаем пользователя nginx
RUN adduser --disabled-password nginx  \
    && chown -R nginx:nginx /etc/nginx/  \
    && chown -R nginx:nginx /home \
    && chown -R nginx:nginx /var/log/nginx/ \
    && chown -R nginx:nginx /var/lib/nginx/ \
    && chown -R nginx:nginx /run/

# Переключаемся на пользователя nginx
USER nginx

# Указываем команду для запуска
CMD ["sh", "./start.sh"]


