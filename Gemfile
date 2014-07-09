source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group  :development  do 
  gem 'sqlite3'
  gem "magic_encoding" # 解決 Rails 中文顯示問題
  gem "annotate" # 在 Model 裡顯示對應的資料庫設定
  gem "letter_opener" # 預覽發送的 Mail 內容
  gem "better_errors", "~> 0.9.0" #錯誤訊息幫手
  gem 'meta_request' # 查看 log @ chrome 神器
end

#for heroku
group  :production  do 
  gem  'pg' ,  '0.15.1' 
  gem  'rails_12factor' ,  '0.0.2' 
end

# 幫助表單輸入用
gem "simple_form", "~> 3.0.0.rc" 

gem "seo_helper"

# CSS 套件
gem "susy"
gem 'compass', '>= 0.12.2'
gem 'compass-rails', '>= 1.0.3'
gem "bootstrap_helper", ">= 4.2.2.1"
gem "anjlab-bootstrap-rails", "2.3.1.2", :require => "bootstrap-rails"

# 身份驗證功能
gem "devise", "~> 3.2.2"
gem "omniauth"
gem "omniauth-facebook" 
gem "auto-facebook", "0.42"

# embedly for jQuery Preview
gem "embedly", "~> 1.8.0"

gem "settingslogic", "~> 2.0.9"

# 圖片上傳功能
gem 'carrierwave'