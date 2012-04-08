source "http://ruby.taobao.org"

# Declare your gem's dependencies in ruser.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
#gem "jquery-rails"

#gem "rails", "3.2.3"
gem "rails-i18n","0.1.8"
gem "jquery-rails", "1.0.16"
gem "rails_autolink", ">= 1.0.4"
gem "jquery-atwho-rails", "0.1.3"

group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>= 1.0.3'
end

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
# 
#this is for init_breadcrume....
#gem 'bootstrap-rails', :require => 'bootstrap-rails', :git => 'https://github.com/xdite/bootstrap-rails.git'
#gem 'bootstrap-rails', :require => 'bootstrap-rails', :path => '~/vob/bootstrap-rails'
gem 'bootstrap-rails',:path=>"~/vob/github/bootstrap-rails"
# YAML 配置信息
gem "settingslogic", "~> 2.0.6"

gem "cells", "3.8.3"

#gem 'mail_view', :git => 'http://github.com/37signals/mail_view.git'
gem 'mail_view', :path=>"~/vob/github/mail_view"
# 上传组件
gem 'carrierwave', '0.5.7'
gem 'carrierwave-mongoid', '0.1.2', :require => 'carrierwave/mongoid'
gem 'carrierwave-upyun', '0.1.3'
gem 'mini_magick','3.3'

# Mongoid 辅助插件
gem "mongoid", "2.4.3"
gem "bson_ext", "1.5.2"
gem 'mongo-rails-instrumentation','0.2.4'
gem 'mongoid_auto_increment_id', "0.4.0"
gem 'mongoid_rails_migrations', '~> 0.0.14'

# Redis 命名空间
gem 'redis-namespace','~> 1.0.2'

# 将一些数据存放入 Redis
gem "redis-objects", "0.5.2"

# 队列
gem "resque", "~> 1.20.0", :require => "resque/server"
gem "resque_mailer", '2.0.2'

# Github API
gem 'ruby-github'

# 用户系统
gem 'devise', '~>2.0.4'

# permission
gem "cancan", "~> 1.6.7"

# 三方平台 OAuth 验证登陆
gem "omniauth", "~> 1.0.1"
gem 'omniauth-openid', "~> 1.0.1"
gem "omniauth-github", "~> 1.0.0"
gem "omniauth-twitter", "~> 0.0.7"
#gem "omniauth-douban", :git => "git://github.com/ballantyne/omniauth-douban.git"
#gem "omniauth-douban", :git => "http://github.com/ballantyne/omniauth-douban.git"

group :development, :test do
  gem 'capistrano', '2.9.0'
  gem 'chunky_png', "1.2.5"
  gem "memcache-client", "1.8.5"
  gem 'progress_bar'
  gem 'rspec-rails', '~> 2.8.1'
 gem 'factory_girl_rails'
  gem 'thin'
  gem "simplecov", :require => false
  gem "rspec-cells"
  gem "capybara"
  gem "sunspot-rails-tester"
end