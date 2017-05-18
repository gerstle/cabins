# Base image:
FROM ruby:2.3.1

MAINTAINER Casey Gerstle <gerstle@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libmysqlclient-dev vim

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/cabins
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Gems:
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

COPY config/puma.rb config/puma.rb

# Copy the main application.
COPY . .

EXPOSE 3000

# The default command that gets ran will be to start the Puma server.
CMD bundle exec puma -C config/puma.rb