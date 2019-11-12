# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'turbolinks'

gem 'acts-as-taggable-on'
gem 'administrate'
gem 'administrate-field-active_storage'
gem 'administrate-field-acts_as_taggable'
gem 'administrate-field-image', '~> 1.1'
gem 'administrate-field-nested_has_many'
gem 'administrate-field-simple_markdown'
gem 'carrierwave', '~> 1.0'
gem 'capistrano', '~> 3.11'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
gem 'devise'
gem 'devise-jwt'
gem 'fast_jsonapi'
gem "graphql"
gem 'graphql-batch'
gem 'image_processing', '~> 1.2'
gem 'mini_magick'
gem 'promise.rb'
gem 'rack-cors'
gem 'rolify'
gem 'graphdoc-ruby'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.2' # Autoload dotenv in Rails app (for puma only, foreman will autoload .env file)
  gem 'factory_bot_rails' # Spec factories
  gem 'pry', '~> 0.12.2' # An IRB alternative and runtime developer console
  gem 'pry-byebug', '~> 3.7' # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue' and 'break' commands to control execution.
  gem 'pry-rails', '~> 0.3.9' # Use Pry as your rails console
  gem 'pundit-matchers', '~> 1.6.0'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'rspec_api_documentation' # Generate API documentation based on acceptance tests
  gem 'rubocop', '~> 0.71.0', require: false # Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop-rails'
  gem 'shoulda-matchers', '4.0.0.rc1' # Making tests easy on the fingers and eyes
  gem 'search_object', '1.2.0'
  gem 'search_object_graphql', '0.1'
end

group :development do
  gem 'annotate', '~> 2.7', '>= 2.7.4' # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
  gem "graphiql-rails"
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'ordinare', '~> 0.4.0' # Ordinare sorts gems in your Gemfile alphabetically
  gem 'web-console', '>= 3.3.0' # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'rails-erd'
end

group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'ffaker'
end

gem 'decent_exposure', '~> 3.0', '>= 3.0.2' # Way to encapsulate shared emthods in controller
gem 'inherited_resources' # Easy CRUD
gem 'pundit', '~> 2.0' # Object oriented authorization for Rails applications
gem 'sentry-raven' # A gem that provides a client interface for the Sentry error logger
gem 'prettier'
gem 'pronto'
gem 'pronto-rubocop', require: false
gem 'pronto-flay', require: false