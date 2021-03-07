source 'https://rubygems.org'

gem 'rails', '~> 6.0.3', '>= 6.0.3.5'

# This is needed until upstream projects update their gemspecs
# This avoids a vulnerability in 3.7.1
gem 'sprockets', '3.7.2'

gem 'rack'
gem 'ransack', '>= 1.8.8'
gem 'carrierwave'
gem 'pg', '~> 1.0.0'
gem 'rmagick', '~> 2.15.4'
gem 'simple_form', '~> 5.0.1'
gem 'redcarpet'
gem 'geocoder'
gem 'cancancan'
gem 'acts-as-taggable-on', '~> 6.0', '>= 6.0.0' #must be this version for Rails5
gem 'rqrcode'
gem 'vcardigan'

gem 'therubyracer'
gem 'jquery-turbolinks', '>= 2.1.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-datetimepicker'
end

# Handles text messages and voice calls
gem 'twilio-ruby', '~> 4.11.1'

#Handles authentication
gem 'devise', '~> 4.7.0'

# For model versioning
gem 'paper_trail', '>= 9.0.1'

#For nested forms
gem 'cocoon'

group :test, :development do
  gem 'dotenv-rails', '>= 2.7.0'
  gem 'thin'
  gem 'rspec-rails', '>= 3.7.2'
  gem "factory_bot_rails", "~> 4.8", ">= 4.8.2"
  gem 'capybara'
  # Use selenium and chrome for handling JS automated testing
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 4.0'
  gem 'guard-rspec', require: false
  gem 'guard-livereload'
  gem 'launchy'
  gem 'letter_opener'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request', '>= 0.7.0'
  gem 'database_cleaner', '1.0.1'
  gem 'test-unit'
  gem 'pry'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.6', '>= 3.6.1'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use Capistrano for deployment
  gem 'capistrano-rails'

  # Helps you figure out where a piece of the UI is coming from by
  # adding comments to the source code at the begin and end of each template.
  gem 'noisy_partials', git: 'https://github.com/gwshaw/noisy_partials.git'
end

group :production do
  # Use Unicorn as the app server
  gem 'unicorn'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'puma'
  gem 'rails-controller-testing', '>= 1.0.3'
  # Allows you to freeze time during tests
  gem 'timecop'
end

gem 'sass-rails', '>= 5.0.8'
gem 'uglifier', '>= 1.0.3'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.3.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.0'

gem 'jquery-ui-rails', '>= 6.0.1'
gem 'bootstrap-sass', '3.3.7'
