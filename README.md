/dockerfile

FROM ruby:2.6
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && apt-get install -y nginx
    # && mkdir /myapp下に移動した

# Nginx
ADD nginx.conf /etc/nginx/sites-available/myapp.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/myapp.conf /etc/nginx/sites-enabled/myapp.conf

# Rails App
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets

# Start Server
CMD bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

#必要あるかわからないけど、以下追加。
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]


/yml
version: '3'
services:
# puma,rails
  app:
    build:
      context: .
    env_file:
      - ./environments/db.env
    command: bundle exec puma -C config/puma.rb
    volumes:
      - .:/myapp
      - public-data:/myapp/public
      - tmp-data:/myapp/tmp
      - log-data:/myapp/log
    depends_on:
      - db

 #mysql
  db:
    image: mysql:8.0
    env_file:
      - ./environments/db.env
    volumes:
      - mysql-data:/var/lib/mysql  
    environment:
      MYSQL_ROOT_PASSWORD: password
    ports:
      - '3306:3306'
    command: --default-authentication-plugin=mysql_native_password
    #nginx
  web: .
    build: 
     context: containers/nginx
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/myapp
      - public-data:/myapp/public
      - tmp-data:/myapp/tmp
    ports:
      - 80:80
    depends_on:
      - app
    stdin_open: true
    tty: true
volumes:
  mysql-data:
    driver: local
    public-data:
    tmp-data:
    log-data:
    db-data:


/container/nginx/dockerfile
FROM nginx:1.15.8

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/conf.d/myapp.conf

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
