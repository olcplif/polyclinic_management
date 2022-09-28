# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4'

gem 'bootsnap', '~> 1.13', require: false
gem 'factory_bot_rails', '~> 6.2.0'
gem 'font-awesome-sass', '~> 6.2.0'
gem 'importmap-rails', '~> 1.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sassc-rails', '~> 2.1.2'
gem 'simple_form', '~> 5.1'
gem 'sprockets-rails', '~> 3.4'
gem 'stimulus-rails', '~> 1.1'
gem 'turbo-rails', '~> 1.1'
gem 'tzinfo-data', '~> 2.0', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker', '~> 2'
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 5.1.2'
end

group :development do
  gem 'brakeman', '~> 5.2.3', require: false
  gem 'overcommit', '~> 0.59.1'
  gem 'rails_best_practices', '~> 1.23.1'
  gem 'rubocop', '~> 1.36', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara', '~> 3.37.1'
  gem 'database_cleaner', '~> 2.0.1'
  gem 'selenium-webdriver', '~> 4.4'
  gem 'shoulda-matchers', '~> 5.2.0', require: false
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'webdrivers', '~> 5.1'
end
