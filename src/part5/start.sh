#!/bin/bash

# Компиляция сервера
gcc -o server server.c -lfcgi

# Запуск сервера через spawn-fcgi
spawn-fcgi -p 8080 ./server

# Ожидаем немного, чтобы сервер успел запуститься
sleep 2

# Запуск nginx с параметром для работы в фоне
nginx -g "daemon off;"

# Ожидаем пока контейнер не будет завершен
/bin/bash
