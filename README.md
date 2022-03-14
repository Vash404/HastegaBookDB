# Database for the HastegaBook

database with some data inside

# Docker

Create docker image with

```
docker build . -t hastegabookdb
```

Create docker network if not exist (for container to container communication)
```
docker network create hastegabook-net
```

Start the docker from the image
```
docker run --net hastegabook-net --name hastegabookdb -d hastegabookdb
```