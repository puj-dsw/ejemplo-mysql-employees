FROM mysql:5.7.39

ENV MYSQL_DATABASE employees

COPY ./init-contenedor/ /docker-entrypoint-initdb.d/
