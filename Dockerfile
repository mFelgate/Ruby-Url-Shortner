ENV DATABASE_HOST=db
ENV DATABASE_USERNAME=postgres
ENV DATABASE_PASSWORD=password


RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libxml2-dev libxslt-dev

RUN gem install bundler
RUN bundle config build.nokogiri --use-system-libraries

WORKDIR /web
ADD Gemfile /web/
ADD Gemfile.lock /web/
RUN bundle install

EXPOSE 3000

COPY . /web 
run  bundle config set force_ruby_platform true
RUN bundle update
cmd 
