FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY ./deploy/acnl_nginx/acnl_nginx.conf /etc/nginx/conf.d/

ARG SSL_DH_PARAMS
RUN mkdir -p /etc/nginx/ssl && touch /etc/nginx/ssl/dhparams.pem \
 && echo $SSL_DH_PARAMS > /etc/nginx/ssl/dhparams.pem
