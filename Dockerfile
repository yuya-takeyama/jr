FROM ruby:3.1-alpine

COPY . /app
WORKDIR /app
RUN apk --update add build-base git && \
  bundle install --without development

ENTRYPOINT ["bundle", "exec", "jr"]
