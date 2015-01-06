FROM debian:jessie

RUN apt-get update && apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev nodejs wget
WORKDIR /src/ruby
RUN wget --quiet http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz -O ruby.tar.gz && tar zxf ruby.tar.gz -C ./ --strip 1

RUN ./configure && make && make install

ONBUILD ADD . /src/octopress
ONBUILD WORKDIR /src/octopress

ONBUILD RUN gem install bundler && bundle install
ONBUILD RUN rake generate

WORKDIR /src/gwan
RUN wget --quiet http://gwan.ch/archives/gwan_linux64-bit.tar.bz2 -O gwan.tar.bz2 && tar jxf gwan.tar.bz2 -C ./ --strip 1
ONBUILD RUN mkdir -p /src/gwan/0.0.0.0_80/#0.0.0.0 && ln -s /src/octopress/public/ /src/gwan/0.0.0.0_80/#0.0.0.0/www
ENTRYPOINT ./gwan
