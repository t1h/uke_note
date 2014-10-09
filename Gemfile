source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'
gem 'sass-rails', '~> 4.0.2'
gem 'bootstrap-sass', '~> 3.1.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

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
