source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'
#view数をカウントできる。
gem 'impressionist'

#weather-api取得時に使う。
gem 'json', '~> 1.8', '>= 1.8.3'

#ログイン認証用のgem
gem 'devise'
#画像アップロード
gem 'carrierwave'
#画像アップロードのサイズ調節
# gem 'rmagick'
# circleciで、Make sure that `gem install rmagick -v '4.1.2' --source 'https://rubygems.org/'`って言われたから、コマンドからインストールしている。
#AWSを使う時に画像をアップロードするgem。
# gem 'aws-sdk-s3',              '1.46.0', require: false
#active_recordのvalidationがネイティブでサポートされていないため。
gem 'active_storage_validations', '0.8.2'
#画像の大きさなどを処理する
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
# ハッシュ関数のgem。パスワードを適切にハッシュ化することで、たとえ攻撃者によってデータベースからパスワードが漏れてしまった場合でも、Webサイトにログインされないようにでる。
gem 'bcrypt',         '3.1.13'
gem 'bcrypt-ruby', '3.1.2' 
gem 'bootstrap-sass', '3.4.1'
# gem 'faker',  
#avatarが格納されないから、こっちを使って見る。                 '2.1.2'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
gem 'will_paginate',           '3.1.8'
gem 'kaminari'
gem 'bootstrap-will_paginate', '1.0.0'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
#raisl6のリッチテキスト
# gem 'action_text' , github: 'rails/actintext', require: 'action_text'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'



# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
#rails6のリッチテキスト。
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

#rspecのprogressbarを表示してくれる。実行のコマンド% bin/rspec spec/ --format Fuubar
gem 'fuubar'

group :test do
 #rspecには、以下の3つのgemが必要。
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  #rspecのfeatureで必要。
  gem 'capybara', '~> 2.13'
  #Capybaraでテスト中に、現在どのページを開いているのか確認するため
  gem 'launchy'
  #便利。validationが一行くらいでかける。
  gem 'shoulda-matchers',
    git: 'https://github.com/thoughtbot/shoulda-matchers.git',
    branch: 'rails-5'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

 #でバッカーツール
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  #awsデプロイ
  gem 'capistrano', '3.4.0'
  # gem 'capistrano'
  # gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  #RSpecのテストランナーを速くする。
  gem 'spring-commands-rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
#エラーを見やすくするgem
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production, :staging do
  #Railsアプリ用のアプリケーションサーバー
#   gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
