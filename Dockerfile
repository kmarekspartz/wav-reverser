FROM alpine
RUN apk update
RUN apk add lighttpd
RUN apk add sox
COPY cgi.conf /etc/lighttpd/conf.d/cgi.conf
COPY convert.sh /var/www/localhost/htdocs/convert.sh
RUN echo 'include "conf.d/cgi.conf"' >> /etc/lighttpd/lighttpd.conf
CMD lighttpd -D -f /etc/lighttpd/lighttpd.conf & sleep 5 && tail -f /var/log/lighttpd/*
