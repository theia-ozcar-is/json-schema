#Serve the static content using nginx
FROM nginx:1.15

RUN apt-get update && apt-get install -y --no-install-recommends gettext-base

RUN rm /usr/share/nginx/html/index.html

COPY ./observation_document_i18n_schema/ /usr/share/nginx/html
COPY ./provider_import_schema/ /usr/share/nginx/html
COPY configInternationalisation.json /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
