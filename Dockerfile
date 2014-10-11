FROM ruby:2.1-onbuild

WORKDIR /usr/src/app

ENTRYPOINT['puma']
