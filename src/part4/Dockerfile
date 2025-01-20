FROM nginx
USER root
WORKDIR /home/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server/server.c .
COPY ./start.sh .
RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    chmod +x ./start.sh
ENTRYPOINT ["sh", "./start.sh"]
