# Use the official Ruby base image with the version you need
FROM ruby:3.1.1

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose the port that your Rails application will run on
EXPOSE 3000

# Define the command to run your Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
