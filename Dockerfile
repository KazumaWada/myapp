FROM ruby:2.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /myapp

# ルート直下myappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
WORKDIR /myapp
# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
# bundle installの実行
RUN bundle install
# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /myapp

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets