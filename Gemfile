source 'https://rubygems.org'
ruby '2.7.3' # => new from 10.14 mojave

gem 'rails', '5.2.6'

# Use Puma as the app server
gem 'puma', '4.3.9'  # '~> 3.11'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'active_model_serializers'
gem 'bcrypt-ruby'
gem 'will_paginate'
#gem 'bootstrap-will_paginate', '0.0.6'
#gem "gmaps4rails", "1.5.6"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'jquery-rails'

group :development, :test do
    gem 'sqlite3'
end

group :development do
  gem 'annotate', '2.5.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '>= 5'
# gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails'
  gem 'uglifier'
end


group :test do
    gem 'capybara', '1.1.2'
end

group :production do
    gem 'pg', '>= 0.18', '< 2.0'
  	gem 'rails_12factor', '0.0.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
