FROM ruby:3.4-alpine

COPY . /app
WORKDIR /app
RUN apk --update add build-base git && \
  bundle install --without development

ENTRYPOINT ["bundle", "exec", "jr"]
