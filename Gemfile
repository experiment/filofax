source 'https://rubygems.org'
ruby '2.1.1'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby


# TODO, lock to version
gem 'journals', git: "https://9c9fc987dec2b0b137e7fd455845c16144c13abe:x-oauth-basic@github.com/Microryza/journals.git"

gem 'slim'

gem 'sidekiq', '< 3' # Bugsnag isn't sidekiq 3 compatible yet
gem 'sinatra'

group :production do
  # Bugsnag for error tracking
  gem 'bugsnag'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
