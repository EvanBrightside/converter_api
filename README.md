# CRYPTOCURRENCY CONVERTER

## Setup
* git clone `github.com/EvanBrightside/conveter_api.git`
* bundle install
* cp config/database.yml.example config/database.yml
* rails db:setup
* rails db:migrate
* rails db:seed
* bundle exec sidekiq
* rails s

## Tech
* Ruby on Rails 5.2.2
* Ruby 2.6.0

## Usage
* sidekiq: `localhost:3000/sidekiq`
* swagger: `localhost:3000/api-docs/index.html`

## Tests
* bundle exec rspec spec
