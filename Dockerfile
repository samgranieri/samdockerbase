FROM phusion/baseimage:0.9.16
# Update everything and install what I need for rails
RUN apt-get update -qq && \
  apt-get upgrade -y

RUN apt-get install -y \
  curl \
  #python-software-properties \
  #software-properties-common \
  wget

# time to get the latest nodejs
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
  C3173AA6 \
  561F9B9CAC40B2F7
# install the latest ruby packages -- no need to fool around with rbenv
# time to get the latest postgresql client 
# Install NodeJS
RUN apt-add-repository ppa:brightbox/ruby-ng && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
  sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
  curl -sL https://deb.nodesource.com/setup | bash -

RUN apt-get install -y \
      aptitude \
      bison \
      build-essential \
      ca-certificates \
      git-core \
      imagemagick \
      libffi-dev \
      libgdbm-dev \
      libmysqlclient-dev \
      libncurses5-dev \
      libpq-dev \
      libreadline6-dev \
      libssl-dev \
      libxml2-dev \
      libxslt-dev \
      libyaml-dev \
      mysql-client \
      nodejs \
      openssl \
      postgresql-client-9.4 \
      ruby2.2 \
      ruby2.2-dev \
      unzip \
      zlib1g-dev


#if you need java
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get update
#RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#RUN apt-get install -y --no-install-recommends oracle-java8-installer
#RUN apt-get install -y --no-install-recommends \
#  nginx

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

