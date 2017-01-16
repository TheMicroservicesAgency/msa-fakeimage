FROM msagency/msa-image-ruby:latest

# Install the Ruby dependencies
ADD Gemfile /opt/ms/
RUN cd /opt/ms/ && gem install bundler && bundle install

# Override the default endpoints
ADD README.md NAME LICENSE VERSION /opt/ms/
ADD swagger.json /opt/swagger/swagger.json

# Copy all the other application files to /opt/app
ADD run.sh /opt/ms/
ADD app.rb /opt/ms/

# Execute the run script
CMD ["ash", "/opt/ms/run.sh"]
