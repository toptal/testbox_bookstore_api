FROM ruby:2.5.1 AS usable

RUN apt-get update
RUN apt-get install -y build-essential default-mysql-client

COPY . /app
WORKDIR /app
RUN bundle install

EXPOSE 3000

CMD [ "/app/.testbox/run.sh" ]

FROM usable

RUN exit 3
