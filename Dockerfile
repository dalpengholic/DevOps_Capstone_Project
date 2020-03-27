FROM nginx:stable
aaaaaa
RUN rm /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html 
