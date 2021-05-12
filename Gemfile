source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "bcrypt"
gem "bootsnap", ">= 1.4.4", require: false
gem "brakeman"
gem "jbuilder", "~> 2.7"
gem "pg", "~> 1.1"
gem "puma", "~> 5.3"
gem "pundit"
gem "rails"
gem "sass-rails", ">= 6"
gem "turbo-rails"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", "~> 3.5"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "standard"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "rails-controller-testing"
  gem "selenium-webdriver"
  gem "shoulda"
  gem "webdrivers"
end
