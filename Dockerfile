FROM ruby:3.0.0-alpine

RUN apk add --update --virtual \
runtime-deps \
postgresql-client \
build-base \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
libffi-dev \
readline \
build-base \
postgresql-dev \
libc-dev \
linux-headers \
readline-dev \
file \
imagemagick \
git \
tzdata \
ffmpeg \
&& rm -rf /var/cache/apk/*

WORKDIR /anipoggers
COPY . /anipoggers/
ENV BUNDLE_PATH /gems
RUN 
RUN yarn install
RUN bundle install
ENTRYPOINT [ "bin/rails" ]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000