FROM alpine:3.14

RUN apk update && \
    apk add --no-cache \
    nginx \
    openssl

COPY ./conf/wp-nginx.conf /etc/nginx/http.d/

RUN rm /etc/nginx/http.d/default.conf && \
    \
    openssl req -x509 -newkey rsa:2048 -nodes -sha256 \
    -keyout /etc/ssl/private/localhost.key \
    -out /etc/ssl/certs/localhost.crt \
    -subj "/CN=localhost"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
