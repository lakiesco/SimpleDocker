FROM nginx

# Обновляем пакеты (если нужно)
RUN apt update

# Копируем конфиг в правильную директорию
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Запускаем nginx с использованием JSON-формата
CMD ["nginx", "-g", "daemon off;"]

