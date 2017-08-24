source 'https://rubygems.org'

# PostgreSQL driver
#gem 'pg'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

# Sinatra driver
gem 'sinatra', '~> 1.0'
gem 'sinatra-contrib'

gem 'activesupport', '~>4.2.0'
gem 'activerecord', '~>4.2.0'

gem 'rake'
gem 'bcrypt'
gem 'twilio-ruby'

gem 'shotgun', '~>0.9.1'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec', '~>3.0'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
end
