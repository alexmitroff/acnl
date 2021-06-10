FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY ./deploy/acnl_nginx/acnl_nginx.conf /etc/nginx/conf.d/
RUN mkdir -p /etc/nginx/ssl && touch /etc/nginx/ssl/dhparams.pem \
 && echo $DH_PARAMS > /etc/nginx/ssl/dhparams.pem
