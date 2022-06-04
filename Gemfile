# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'
# gem "bcrypt", "~> 3.1.7"
gem 'apollo_upload_server', '2.0.5'
gem 'bootsnap', require: false
gem 'image_processing'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'graphql', '~> 1.12.13'
gem 'jwt'
gem 'rack-cors'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'pry'
  gem 'rubocop-rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
