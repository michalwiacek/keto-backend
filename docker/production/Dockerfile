FROM phusion/passenger-ruby26:latest
MAINTAINER Wiwatta  Mongkhonchit "zentetsukenz@gmail.com"

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Expose Nginx HTTP service
EXPOSE 80

# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Nginx App setup
ADD docker/staging/app.nginx.conf /etc/nginx/sites-enabled/app.nginx.conf
ADD docker/staging/postgres-env.conf /etc/nginx/main.d/postgres-env.conf
ADD docker/staging/rails-env.conf /etc/nginx/main.d/rails-env.conf
ADD docker/staging/app-env.conf /etc/nginx/conf.d/00_app_env.conf

# Update for security reason
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# Gem caching
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install --jobs 20 --retry 5

# App setup
#
# This is your application setup steps, you should also do what you need to do here to make your 
# application working for production environment.
#
WORKDIR /home/app/keto-backend
ADD . /home/app/keto-backend
RUN rm -f config/database.yml
RUN mv config/database.yml.sample config/database.yml
RUN chown -R app:app /home/app/keto-backend
RUN rake assets:precompile RAILS_ENV=production

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*