FROM ruby:2.6.5-alpine
LABEL name="rails-api" version='1'
ENV LANG C.UTF-8

RUN mkdir /app
WORKDIR /app

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache \
        ruby-dev \
        build-base \
        libxml2-dev \
        libxslt-dev \
        pcre-dev \
        libffi-dev \
        openssl \
        curl-dev \
        imagemagick \
        file \
        postgresql-dev \
        cmake \
        tzdata \
        ca-certificates \
        wget && \
        update-ca-certificates

RUN gem install bundler --no-document && \
    gem update --system && \
    gem cleanup all

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs=4 --no-cache --binstubs

COPY . .

LABEL maintainer="Michał Wiącek <michal.wiacek@nekosoft.pl>"

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]