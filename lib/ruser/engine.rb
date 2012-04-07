require 'rubygems'
require 'bootstrap-rails' #, :require => 'bootstrap-rails', :git => 'http://github.com/xdite/bootstrap-rails.git'
require "rails-i18n"#,"0.1.8"
require "jquery-rails"#, "1.0.16"
require "rails_autolink"#, ">= 1.0.4"
require "jquery-atwho-rails"#, "0.1.3"
require 'sass-rails'#, "  ~> 3.2.3"
require 'coffee-rails'#, "~> 3.2.1"
require 'uglifier'#, '>= 1.0.3'
require "settingslogic"#, "~> 2.0.6"
require "cells"#, "3.7.1"
require 'mail_view'#, :git => 'http://github.com/37signals/mail_view.git'
# 上传组件
require 'carrierwave'#, '0.5.7'
#require 'carrierwave-mongoid'#, '0.1.2'#, :require => 'carrierwave/mongoid'
require  'carrierwave/mongoid'
require 'carrierwave-upyun'#, '0.1.3'
require 'mini_magick'#,'3.3'

# Mongoid 辅助插件
require "mongoid"#, "2.4.3"
#require "bson_ext"#, "1.5.2"
require 'mongo-rails-instrumentation'#,'0.2.4'
require 'mongoid_auto_increment_id'#, "0.4.0"
require 'mongoid_rails_migrations'#, '~> 0.0.14'

# Redis 命名空间
require 'redis-namespace'#,'~> 1.0.2'

# 将一些数据存放入 Redis
#require "redis-objects"#, "0.5.2"
require 'redis'
require 'redis/objects'

# 队列
#require "resque"#, "~> 1.20.0"#, :require => "resque/server"
require  "resque/server"
require "resque_mailer"#, '2.0.2'

# Github API
require 'ruby-github'

# 用户系统
require 'devise'#, '~>2.0.4'

# permission
require "cancan"#, "~> 1.6.7"

# 三方平台 OAuth 验证登陆
require "omniauth"#, "~> 1.0.1"
require 'omniauth-openid'#, "~> 1.0.1"
require "omniauth-github"#, "~> 1.0.0"
require "omniauth-twitter"#, "~> 0.0.7"
#gem "omniauth-douban", :git => "git://github.com/ballantyne/omniauth-douban.git"
#require "omniauth-douban"




module Ruser
  class Engine < ::Rails::Engine
    #load all helper, otherwise will cover by parent app with same name
    initializer 'Ruser::Application.helper,Ruser::User.helper,Ruser::ApplicationController' do |app|
      ActionView::Base.send :include, Ruser::ApplicationHelper,Ruser::UsersHelper
      #  ActionController::Base .send :include,  ApplicationHelper,UsersHelper
    end

    config.i18n.default_locale = "zh-CN"
    config.autoload_paths += %W(#{config.root}/uploaders)
    config.autoload_paths += %W(#{config.root}/lib)
    config.time_zone = 'Beijing'

    #   config.i18n.load_path += Dir[config.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[config.root.join('locales', '*.{rb,yml}').to_s]
 
    config.encoding = "utf-8"

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
    
    config.to_prepare {
      Devise::Mailer.layout "mailer"
      
    }

    isolate_namespace Ruser
  end
end
I18n.locale = 'zh-CN'
require 'yaml'
YAML::ENGINE.yamler= 'syck'