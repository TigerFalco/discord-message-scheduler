FROM ruby:2.6.4
RUN apt-get update && apt-get install -qq -y \
    build-essential \
    nodejs \
    npm \
    git \
    zip \
    unzip \
    --fix-missing \
    --no-install-recommends

RUN mkdir -p /var/www/html/app
WORKDIR /var/www/html/app
RUN gem install bundler
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle update --bundler
RUN bundle install

RUN npm install yarn -g

COPY . .
#RUN curl -o- -L https://yarnpkg.com/install.sh | bash

RUN rails assets:precompile


COPY ./docker/start.sh /start.sh
RUN chmod +x /start.sh

ENV RAILS_ENV production
ENV PORT 80

EXPOSE 80
CMD ["bash", "/start.sh"]