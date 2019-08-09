FROM ruby:2.6
WORKDIR /usr/src/app/
RUN gem install bundler --no-document
ADD Gemfile* /usr/src/app/
RUN bundle install --path vendor/bundle
COPY . /usr/src/app/
EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "--binding", "0.0.0.0", "--port", "3000"]
