source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
gem 'rack'
gem 'ransack'
gem 'carrierwave'
gem "pg"
gem 'rmagick', '~> 2.15.4'
gem 'simple_form'
gem 'geocoder'
gem 'cancan'

#Handles authentication
gem 'devise', '~> 4.2.0'

group :test, :development do
  gem 'thin'
  gem "rspec-rails"
  gem 'rspec-activemodel-mocks' # TODO: remove if we no longer need mock_model or stub_model
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec", require: false
  gem 'guard-livereload'
  gem 'sqlite3'
  gem "mailcatcher"
  gem "launchy"
  gem "letter_opener"
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'database_cleaner'
  gem 'test-unit'
  gem 'poltergeist'
  gem 'pry'
end

group :test do
  gem 'shoulda-matchers'
  # This is reportedly necessary to use the `assigns` and `assert_template` helpers
  # in Rails 5.0.
  gem 'rails-controller-testing'
end

group :assets do
  # Gems used only for assets and not required
  # in production environments by default.
  gem 'jquery-rails'

  gem 'sass-rails'
  gem 'coffee-rails'
  #The following provides the stylinmg for the datatables, among other things
  gem 'jquery-ui-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '~> 3.0'
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'bootstrap-sass', '~> 3.3.6'
  gem 'chosen-rails'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.5'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
group :production do
  # Use unicorn as the app server
  gem 'unicorn', '~> 5.1.0'
end

# Deploy with Capistrano
gem 'capistrano', '~> 2.15'
# This is used by Capistrano, but 2.8 has issues
gem "net-ssh", "~> 2.7.0"

# To use debugger
# gem 'debugger'
