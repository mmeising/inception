FROM alpine:3.16

RUN apk --update add --no-cache nginx openssl

WORKDIR /var/www/nginx

COPY nginx.conf /etc/nginx/http.d/nginx.conf
# COPY ../../src/index.php /var/www/nginx/
# ADD . .
# ADD conf.d/nginx.conf /etc/nginx/

# RUN mkdir /etc/ssl && chown -R root:root /etc/ssl/ && chmod -R 600 /etc/ssl/

# RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 -sha256 \
#         -keyout /etc/ssl/private/inception.key                  \
#         -out /etc/ssl/certs/inception.crt                       \
#         -subj "/CN=mmeising.42.fr"


EXPOSE 443

# CMD ["exec nginx"]

ENTRYPOINT ["nginx", "-g", "daemon off;"]
