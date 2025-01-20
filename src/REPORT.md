## PART 1

- **Берем официальный Docker образ nginx с DockerHub**
![Docker pull](images/1.png)


- **Проверяем наличие докер образа**

    ![Docker images](images/2.png)


- **Создаем котейнер на основе Docker образа nginx. Контейнер работает в фоновом режиме за счет флага -d.**
![Docker run -d](images/3.png)


- **Проверяем наличие запущенного контейнера nginx.**

    ![Docker ps](images/4.png)


- **Получаем подробную информацию о контейнере в JSON формате. С помощью флага -s получаем размер контейнера.**

    ![Docker inspect -s](images/5.png)

    **Исходя из JSON вывода команды docker inspect мы получаем:**
1. Размер контейнера(SizeRootFs) + размер файловой системы контейнера(SizeRw). Информация предоставляется в байтах:

    ![Container size + file system size](images/6.png)

2. Замапленные порты:
    
    ![Port_Bindings](images/7.png)

3. IP контейнера:

    ![Container IP](images/8.png)


- **Останавливем nginx контейнер** 
  
    ![Docker stop](images/9.png)


- **Проверяем, что контейнер остановлен**

    ![Docker ps](images/10.png)


- **Создаем контейнер с замапленными портами 80 и 443**

  ![Docker ps](images/11.png)


- **Проверяем замапленный 80 порт с помощью localhost:80**

  ![Docker ps](images/12.png)


- **Перезапускаем контейнер**
  
    ![Docker ps](images/13.png)


- **Проверяем, что контейнер перезапустился**

  ![Docker ps](images/14.png)




## PART 2

- **Читаем конфиг файл nginx и создаем его на хост машине**

  ![Nginx conf check](images/15.png)


- **Настраиваем nginx.conf для отдачи страницы статуса nginx, загружаем новый конфиг через docker cp и перезагружаем nginx**

  ![Nginx conf check](images/16.png)


- **Проверяем, что по адресу localhost:80/status отдается страница статуса**

1. localhost:80/status

    ![status page](images/17.png)


- **Экспортируем файловую систему контейнера в container.tar**

    ![Docker export](images/19.png)


- **Останавливаем контейнер**

  ![Docker export](images/20.png)


- **Удаляем образ не удаляя контейнеры**

  ![Docker export](images/21.png)


- **Импортируем экспортированный образ (container.tar)**

  ![Docker export](images/22.png)


- **Создаем контейнер на основе нашего образа**

  ![Docker export](images/23.png)


- **Проверяем, что после запуска контейнера страница localhost:80/status работает**

1. localhost:80/status

   ![Dcoker export](images/24.png)


## PART 3

- **Пишем простенький fcgi сервер, который будет отдавать Hello World на каждый звпрос от веб сервера.** 
  
     ![Dcoker export](images/25.png)


- **Запускаем наше приложение через spawn-fcgi и устанавливаем порт 8080**
  - spawn-fcgi -p 8080 -n fcgi
  
    ![spawn-cgi](images/26.png)


- **Добавялем директиву server и location в конфиг nginx. Директива server будет слушать 81 порт и проксировать запросы на порт 8080.**

  ![nginx_conf](images/27.png)


- **Заходим в браузер и подключаемся по localhost:81**

  ![hello_world](images/28.png)

## PART 4

- **Пишем докерфайл**

  ![hello_world](images/dockerfile.png)


- **Собираем докер образ с помощью docker build. Указываем имя и тег(версию) образа**

  ![hello_world](images/29.png)


- **Запускаем docker образ с замапленными портами 80 на 81 контейнера и маппим наш nginx конфиг**

  ![hello_world](images/30.png)


- **Провряем что на localhost:80 доступна написанная нами страница**

  ![hello_world](images/31.png)


- **Добавляем в nginx.conf страницу статуса nginx**

  ![hello_world](images/33.png)



- **Проверяем, что по адресу localhost:80/status отдается страница статуса**

  ![hello_world](images/32.png)


## PART 5

- **Проверяем с помощью утилиты dockle безопасность нашего docker образа**

  ![hello_world](images/34.png)
  - CIS-DI-0001: Create a user for the container
Лучше не запускать контейнер от имени пользователя root. Для этого можно создать нового пользователя и запускать контейнер от его имени. 
  - CIS-DI-0005: Enable Content trust for Docker
Это информационное сообщение, которое напоминает о том, что можно включить Content Trust для Docker, чтобы убедиться, что образы, которые вы загружаете или строите, подписаны. Это делается с помощью переменной окружения DOCKER_CONTENT_TRUST=1
- **Проверяем после всех исправлений**
    ![hello_world](images/35.png)


## PART 6

- **Поднимаем первый контейнер без маппинга портов**

  ![hello_world](images/36.png)
  
- Поднимаем чистый nginx сервер с маппингои 80 на 8080, а внутри проксируем все на 81.

  ![hello_world](images/37.png)
  - Dockerfile
  
    ![hello_world](images/38.png)

  - nginx.conf
  
    ![hello_world](images/39,1.png)
  
  - IP первого контейнера
  
    ![hello_world](images/40.png)
  
  - Проверяем, что все работает
  
    ![hello_world](images/41.png)


- **Останавливаем все контейнеры**

  ![hello_world](images/42.png)


- **Собираем и запускаем проект с помощью docker-compose build и docker-compose up**
  ![hello_world](images/43.png)
  - Docker-compose файл
  
    ![hello_world](images/43.1.png)

- **Проверяем, что все работает**

  ![hello_world](images/44.png)