source 'http://rubygems.org'

# Core rails gems
gem 'rails', '3.0.11'
gem 'json', '>=1.4.6'
gem 'pg', '>=0.10.0'
gem 'sqlite3-ruby', :require => 'sqlite3'

# User/auth gems
gem 'devise'
gem 'devise_bushido_authenticatable', :git => 'git://github.com/Bushido/devise_cas_authenticatable.git'
gem 'cancan'

# Background workers
gem 'resque'
gem 'resque-scheduler'
gem 'resque_mailer'

# Cloud/Network gems
gem 'rest-client'
gem 'aws-s3'

# Misc. gems
gem 'bushido', :git => "git://github.com/Bushido/bushidogem.git"
gem 'uuid'
gem 'awesome_print'

# Markdown/syntax
gem 'redcarpet'
gem 'albino'
gem 'nokogiri'

# Assets
gem 'closure-compiler'
gem 'yui-compressor'
gem 'jammit'
gem 'compass', '>= 0.10.6'
gem 'compass-colors'
gem 'fancy-buttons'

# Bundle gems for the local environment. Make sure to put test-only
# gems in this group so their generators and rake tasks are available
# in development mode:
group :development, :test do
  gem 'foreman'
  gem 'ruby-debug19'
  gem 'rspec'
  gem 'rspec-rails', '~> 2.4'
  gem 'shoulda-matchers'
  gem 'ZenTest', '>=4.4.2'
  gem 'autotest'
  gem 'autotest-rails'
  gem 'vcr'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'email_spec'
  gem 'jasmine'
  gem 'ci_reporter'
  gem 'no_peeping_toms', :git => 'git://github.com/alindeman/no_peeping_toms.git'
  gem 'watchr'
  gem 'tane', :path => '/remote/tane'
end

group :test do
  gem 'cover_me', '>= 1.0.0.rc6'
  gem 'capybara-webkit'
  gem 'rspec-prof'
  gem 'webmock'
end
