FROM ruby:2.1-onbuild

WORKDIR /usr/src/app

EXPOSE 9292

ENTRYPOINT ['puma']
