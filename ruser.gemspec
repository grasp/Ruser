$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ruser/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ruser"
  s.version     = Ruser::VERSION
  s.authors     = ["hunter"]
  s.email       = ["hunter.wxhu@gmail.com"]
  s.homepage    = "http://github.com"
  s.summary     = " Summary of Ruser."
  s.description = " Description of Ruser."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  
  # s.add_dependency "jquery-rails"
  
  
    s.add_dependency "rails", "~> 3.2.3"
    
    s.add_dependency "settingslogic", "~> 2.0.6"

  s.add_dependency "cells", "3.8.3"

  s.add_dependency 'mail_view'#, :git => 'http://github.com/37signals/mail_view.git'

# 上传组件
  s.add_dependency 'carrierwave', '0.5.7'
  s.add_dependency 'carrierwave-mongoid', '0.1.2'#, :require => 'carrierwave/mongoid'
  s.add_dependency 'carrierwave-upyun', '0.1.3'
  s.add_dependency 'mini_magick','3.3'

# Mongoid 辅助插件
  s.add_dependency "mongoid", "2.4.3"
  s.add_dependency "bson_ext", "1.5.2"
  s.add_dependency 'mongo-rails-instrumentation','0.2.4'
  s.add_dependency 'mongoid_auto_increment_id', "0.4.0"
  s.add_dependency 'mongoid_rails_migrations', '~> 0.0.14'

# Redis 命名空间
  s.add_dependency 'redis-namespace','~> 1.0.2'

# 将一些数据存放入 Redis
  s.add_dependency "redis-objects", "0.5.2"

# 队列
  s.add_dependency "resque", "~> 1.20.0"#, :require => "resque/server"
  s.add_dependency "resque_mailer", '2.0.2'

# Github API
  s.add_dependency 'ruby-github'

# 用户系统
  s.add_dependency 'devise', '~>2.0.4'

# permission
  s.add_dependency "cancan", "~> 1.6.7"

# 三方平台 OAuth 验证登陆
  s.add_dependency "omniauth", "~> 1.0.1"
  s.add_dependency 'omniauth-openid', "~> 1.0.1"
  s.add_dependency "omniauth-github", "~> 1.0.0"
  s.add_dependency "omniauth-twitter", "~> 0.0.7"
#gem "omniauth-douban", :git => "git://github.com/ballantyne/omniauth-douban.git"
 # s.add_dependency "omniauth-douban"#, :git => "http://github.com/ballantyne/omniauth-douban.git"

  s.add_dependency "watir-webdriver"

  s.add_development_dependency "sqlite3"
end
