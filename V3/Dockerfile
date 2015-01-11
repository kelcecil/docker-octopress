FROM debian:jessie

# Get the dependencies for Octopress page generation
RUN apt-get update && \
	apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev nodejs python-pygments wget && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Build Ruby
WORKDIR /src/ruby
RUN wget --quiet http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz -O ruby.tar.gz && tar zxf ruby.tar.gz -C ./ --strip 1
RUN ./configure && make && make install

# Get gwan
WORKDIR /src/gwan
RUN wget --quiet http://gwan.ch/archives/gwan_linux64-bit.tar.bz2 -O gwan.tar.bz2 && tar jxf gwan.tar.bz2 -C ./ --strip 1

EXPOSE 80

# Add the included octopress source
ONBUILD ADD . /src/octopress

# Get the gems required gems and generate the page
ONBUILD WORKDIR /src/octopress

# Should make sure that jekyll and octopress are installed.
ONBUILD RUN gem install jekyll && gem install octopress --pre
ONBUILD RUN jekyll build

# Link the public files from octopress.
ONBUILD RUN mkdir -p /src/gwan/0.0.0.0_80/#0.0.0.0 && ln -s /src/octopress/_site/ /src/gwan/0.0.0.0_80/#0.0.0.0/www

# Set the workdir back to gwan.
ONBUILD WORKDIR /src/gwan
ENTRYPOINT ./gwan
