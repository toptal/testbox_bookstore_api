FROM ruby:2.5.1

RUN apt-get update
RUN apt-get install -y build-essential default-mysql-client

COPY . /platform
WORKDIR /platform
RUN bundle install

EXPOSE 3000

CMD [ "/platform/.testbox/run.sh" ]
