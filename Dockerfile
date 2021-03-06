FROM msagency/msa-image-ruby:1.0.2

# Install the Ruby dependencies
ADD Gemfile /opt/ms/
ADD Gemfile.lock /opt/ms/

RUN apk add --update freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev autoconf g++ imagemagick-dev libtool make \
    && cd /opt/ms/ \
    && gem install bundler \
    && bundle install \
    && apk del autoconf g++ libtool make \
    && rm -rf /tmp/* /var/cache/apk/*

# Override the default endpoints
ADD README.md NAME LICENSE VERSION /opt/ms/
ADD swagger.json /opt/swagger/swagger.json

# Override the Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy all the other application files to /opt/app
ADD run.sh /opt/ms/

# Copy the app
ADD fakeimage/fakeimage.rb /opt/ms/

# Override the default font with something very similar but a bit more light
ADD OpenSans-Light.ttf /opt/ms/DroidSans.ttf

# Execute the run script
CMD ["ash", "/opt/ms/run.sh"]
