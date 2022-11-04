# TestboxBookstoreApi

A dummy Rails app to act as a backend part of a demo web stack.

## How to test

```shell
docker build --target usable --tag testbox_bookstore_api .
docker build --tag testbox_bookstore_api .
docker run --rm -it --entrypoint /bin/bash testbox_bookstore_api
```

```shell
docker run \
  --rm -it \
  --name service-mysql \
  -e MYSQL_USER=bookstore \
  -e MYSQL_ROOT_PASSWORD=bookstore \
  -e MYSQL_PASSWORD=bookstore \
  -e MYSQL_DATABASE=bookstore_api \
  --publish 0.0.0.0:3306:3306 \
  mysql/mysql-server:5.6

export MYSQL_USER=bookstore
export MYSQL_PASSWORD=bookstore
export MYSQL_DATABASE=bookstore_api
export MYSQL_HOST=127.0.0.1

sudo rm -rf tmp/{cache,pids,sockets}
bin/setup
RAILS_ENV=production bin/rails db:seed

SECRET_KEY_BASE=abc RAILS_ENV=production RAILS_LOG_TO_STDOUT=true bin/rails server

open http://0.0.0.0:3000/books
```
