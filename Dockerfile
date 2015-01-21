FROM phusion/baseimage:0.9.16
# Update everything and install what I need for rails
RUN apt-get update -qq && \
    apt-get install -y \
      bison \
      build-essential \
      ca-certificates \
      curl \
      git-core \
      imagemagick \
      libffi-dev \
      libgdbm-dev \
      libncurses5-dev \
      libpq-dev \
      libreadline6-dev \
      libssl-dev \
      libxml2-dev \
      libxslt-dev \
      libyaml-dev \
      nginx \
      openssl \
      python-software-properties \
      software-properties-common \
      unzip \
      zlib1g-dev
# time to get brightbox ruby and oracle java 8
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN add-apt-repository ppa:webupd8team/java
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
C3173AA6 561F9B9CAC40B2F7
# time to get the latest nodejs
RUN apt-get update -qq
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get install nodejs -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# install the latest ruby and a lot of gems
RUN apt-get install -y ruby2.2 aptitude ruby2.2-dev
RUN gem update --no-ri --no-rdoc
RUN gem install rails pg sidekiq unicorn puma --no-ri --no-rdoc
RUN gem install --no-ri --no-rdoc \
  sass-rails\
  haml-rails\
  kaminari\
  rspec-rails\
  mongoid\
  html2haml\
  carrierwave\
  dotenv\
  pry\
  awesome_print\
  guard\
  devise\
  cancancan\
  draper\
  quiet_assets\
  high_voltage\
  rails_layout\
  autoprefixer-rails\
  simple_form\
  bootstrap-sass\
  font-awesome-sass
RUN apt-get install -y mysql-client libmysqlclient-dev
RUN gem install --no-ri --no-rdoc mysql2
