source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.4'
gem 'sass-rails', '~> 4.0.2'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 1.2'
group :doc do
  gem 'sdoc', require: false
end

gem 'compass-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'squeel'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'rails-i18n'
gem 'chordpro'
gem 'transpose_chords', '= 0.0.4', github: 'patchfx/transpose_chords'
gem 'nokogiri'

group :test, :development do
  gem 'i18n_generators'
  gem 'sqlite3'
  gem 'letter_opener'
  gem "spring"
  gem "spring-commands-rspec"
  gem 'dotenv-rails'
  gem 'hirb-unicode'
end
group :test do
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy"
end
group :production, :staging do
  gem 'pg'
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

platforms :ruby do # linux
  gem 'unicorn'
end
