FROM msagency/msa-image-ruby:latest

# Install the Ruby dependencies
ADD Gemfile /opt/ms/
RUN apk add --update freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev autoconf g++ imagemagick-dev libtool make

RUN apk add --update freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev autoconf g++ imagemagick-dev libtool make \
    && cd /opt/ms/ \
    && gem install bundler \
    && bundle install \
    && apk del autoconf g++ libtool make \
    && rm -rf /tmp/* /var/cache/apk/*

# Override the default endpoints
ADD README.md NAME LICENSE VERSION /opt/ms/
ADD swagger.json /opt/swagger/swagger.json

# Copy all the other application files to /opt/app
ADD run.sh /opt/ms/

ADD fakeimage/DroidSans.ttf /opt/ms/
ADD fakeimage/fakeimage.rb /opt/ms/

# Execute the run script
CMD ["ash", "/opt/ms/run.sh"]
