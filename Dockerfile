# Use the official Ruby image with version 3.2.2
FROM ruby:3.2.2

# Update and install dependencies
RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
        nodejs \
        npm \
    && npm install -g yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app/

# Copy the application code into the container
COPY . /usr/src/app/

# Set the build argument for SECRET_KEY_BASE
ARG SECRET_KEY_BASE

# Set environment variables
ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

# Install Bundler and project dependencies
RUN gem install bundler:2.2.3
RUN bundle install

# Run database migrations
RUN rake db:migrate
RUN rails db:migrate RAILS_ENV=test

# Run tests
RUN rails test

# Precompile assets
RUN rails assets:precompile

# Set the default command to run the Rails server
CMD ["rails", "server"]