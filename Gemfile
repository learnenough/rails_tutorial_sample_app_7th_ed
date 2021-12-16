source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails",           "7.0.0"
gem "sprockets-rails", "3.4.2"
gem "puma",            "5.5.2"
gem "importmap-rails", "1.0.1"
gem "turbo-rails",     "1.0.0"
gem "stimulus-rails",  "1.0.0"
gem "jbuilder",        "2.11.3"
gem "bootsnap",        "1.9.3", require: false

group :development, :test do
  gem "debug",   "1.3.4", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "1.4.2"
end

group :development do
  gem "web-console", "4.2.0"
end

group :test do
  gem "capybara",           "3.36.0"
  gem "selenium-webdriver", "4.1.0"
  gem "webdrivers",         "5.0.0"
end

group :production do
  gem 'pg', '1.2.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem.
# Uncomment the following line if you're running Rails
# on a native Windows system:
# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
