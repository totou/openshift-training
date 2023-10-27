FROM nginx:1.25.2 as myimage
LABEL org.opencontainers.image.authors="me@myorg.com"
LABEL description="My example build for the training"

ENV MYVAR "42"

#COPY --link myindex.html /usr/share/nginx/html/
COPY myindex.html /usr/share/nginx/html/

