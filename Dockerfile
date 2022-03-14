# Create mysql server based on the official image from the dockerhub
FROM mysql:5
# Add a database & root password
ENV MYSQL_DATABASE hastega
ENV MYSQL_ROOT_PASSWORD=hastega
ENV MYSQL_ROOT_HOST=%

COPY ./sql/ /docker-entrypoint-initdb.d/