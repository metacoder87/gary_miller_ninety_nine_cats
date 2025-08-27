source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'bundler', '~> 2.4.7' 
gem 'rails', '~> 6.1.7', '>= 6.1.7.10' # Update to latest 6.1.x patch for Ruby 3.1.0 compatibility
gem 'pg', '~> 1.5.8' # Update to latest pg version for better Ruby 3.1.0 support
gem 'puma', '~> 6.4' # Update to Puma 6.x for Ruby 3.1.0 compatibility and performance
gem 'sass-rails', '~> 6.0.0' # Keep, but ensure latest version
# Replace sassc with sassc-rails, as sassc is deprecated
gem 'sassc-rails', '~> 2.1.2'
# Replace uglifier with terser, as uglifier is outdated and doesn't support modern JS
gem 'terser', '~> 1.2.3'
# Remove coffee-rails, as CoffeeScript is largely deprecated; use plain JS or ES6
# gem 'coffee-rails', '~> 4.2' # Commented out, recommend removing unless still needed
gem 'turbolinks', '~> 5.2' # Keep, latest version in 5.x series
gem 'jbuilder', '~> 2.12' # Update to latest 2.x version
gem 'redis', '~> 5.3' # Update to latest 5.x version for Ruby 3.1.0
gem 'bcrypt', '~> 3.1.20' # Update to latest 3.1.x version
gem 'faker', '~> 3.4' # Update to latest version for Ruby 3.1.0 compatibility
gem 'bootsnap', '~> 1.18.4', require: false # Update to latest version
gem 'capistrano-rails', '~> 1.6', group: :development # Update to latest version

group :development, :test do
  gem 'selenium-webdriver', '~> 4.1' # Update to latest 4.x version
  gem 'pry-rails', '~> 0.3.11' # Update to latest version
  gem 'better_errors', '~> 2.10' # Update to latest version
  gem 'binding_of_caller', '~> 1.0' # Update to latest version
end

group :development do
  gem 'web-console', '~> 4.2' # Update to latest version
  gem 'listen', '~> 3.9' # Update to latest version, remove restrictive upper bound
  gem 'spring', '~> 4.2' # Update to latest version for Ruby 3.1.0 compatibility
  gem 'spring-watcher-listen', '~> 2.1' # Update to latest version
  gem 'letter_opener', '~> 1.10' # Update to latest version
end

group :test do
  gem 'capybara', '~> 3.40' # Update to latest version
  gem 'webdrivers', '~> 5.3' # Update to latest version, remove exact version pin
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
