FROM ruby:2.7.1-buster

RUN apt-get update -qq && apt-get install -y postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install
COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3100

# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]