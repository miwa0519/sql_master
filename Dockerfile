FROM ruby:2.6.6-alpine
ENV LANG C.UTF-8
RUN apk add --update --no-cache --virtual=builders \
  alpine-sdk build-base linux-headers ruby-dev zlib-dev mysql-client mysql-dev icu-dev
RUN apk add --update --no-cache \
  libc6-compat libc-dev zlib ruby-json tzdata yaml less nodejs yarn curl
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN gem install bundler -v 2.0.2
RUN bundle
RUN yarn
