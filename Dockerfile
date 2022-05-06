FROM ruby:2.6.5 as usable

RUN apt-get update
RUN apt-get install -y build-essential default-mysql-client wait-for-it

COPY . /app
WORKDIR /app

RUN gem install bundler:2.3.10 --no-document
RUN bundle install

EXPOSE 3000

CMD [ "/app/.testbox/run.sh" ]

FROM usable

# This stage always fails, useful for testing the `target` config option
# (see .testbox/config.yml)

RUN exit 3
