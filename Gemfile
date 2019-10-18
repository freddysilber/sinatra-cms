# Gemfile
source 'https://rubygems.org'

# gem 'activerecord', '>= 4.2.7.1', :require => 'active_record'
gem 'activerecord', '5.2'
gem 'sinatra-activerecord'
# gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra'
gem 'rake'
gem 'require_all'
# gem 'sqlite3', '~> 1.4'
# gem 'tux'
# gem 'pry'
gem 'thin'
# gem 'shotgun'
gem 'bcrypt'

group :development do
    gem 'shotgun'
    gem 'pry'
    gem 'tux'
    gem 'sqlite3', '~> 1.3.6'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end