FROM ruby:3.0.4 as usable

RUN apt-get update && apt-get install --yes --no-install-recommends \
  build-essential default-mysql-client wait-for-it

RUN gem install bundler:2.3.21 --no-document

COPY . /app
WORKDIR /app

RUN bundle install

EXPOSE 3000

CMD [ "/app/.testbox/run.sh" ]

FROM usable

# This stage always fails, useful for testing the `target` config option
# (see .testbox/config.yml)

RUN exit 3
