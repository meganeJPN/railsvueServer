FROM ruby:3.0.3

# yarnインストール時のバージョンを指定
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# パッケージリスト更新後、railsとDBに必要なパッケージインストール
RUN apt-get update && apt-get install -y nodejs postgresql-client yarn

# /usr/src/appを作業ディレクトリとし、Gemfile Gemfile.lockをコピーする
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./

# プリコンパイル済みのものを使用しない
RUN bundle config set force_ruby_platform true

# コピーしたGemfile Gemfile.lockに書いてあるGemをinstallする
RUN bundle install

# railsのアプリを含め、すべてのファイルをコピー
COPY . ./

# docker compose up時に実行する起動スクリプトを設定
CMD ["sh", "/usr/src/app/start.sh"]