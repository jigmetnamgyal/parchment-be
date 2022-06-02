source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"
gem 'rails', '~> 6.1.6'
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
# gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "rack-cors"
gem 'graphql'
gem 'jwt'

group :development, :test do
  gem 'rubocop-rails'
  gem 'pry'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

