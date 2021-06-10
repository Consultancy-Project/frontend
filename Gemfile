source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '>= 2.1.0'

gem 'json'
gem 'faker'
gem 'figaro'
gem 'faraday'
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-rails_csrf_protection'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'orderly'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
