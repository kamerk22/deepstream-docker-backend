# deepstream-docker-backend
Deepstream.io with Redis and RethinkDB Backend in Docker

Feature included:

 - deepstream.io
 - deepstream.io-search-provider
 - RethinkDB
 - Redis

# How to run
```sh
$ git clone https://github.com/kamerk22/deepstream-docker-backend.git
$ cd deepstream-docker-backend
```
Make sure you have docker and docker-compose install.

```sh
$ docker-compose up
```
That's it!

# How to modify

For additional plugins add this in Dockerfile

```sh
RUN deepstream install storage postgres && \
    deepstream install storage elasticsearch && \
    deepstream install storage mongodb && \
    deepstream install storage rethinkdb && \
    deepstream install cache redis && \
    deepstream install cache hazelcast && \
    deepstream install cache memcached && \
    deepstream install msg kafka && \
    deepstream install msg amqp && \
    deepstream install msg redis
```

