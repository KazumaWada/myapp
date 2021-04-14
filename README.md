
[![<ORG_NAME>](https://circleci.com/gh/kazumawada/myapp.svg?style=svg)](https://app.circleci.com/pipelines/github/kazumawada/myapp)

# ベルリンなう https://berlin-now.net  
 ベルリンにまつわることを共有するサービスです。
「かんたんログイン」を使って下さい。

![FireShot Capture 064 - ベルリンなう - localhost](https://user-images.githubusercontent.com/57794648/110725759-74508180-825b-11eb-9a57-c31f9e757e80.png)

<br><br>

# クラウドアーキテクチャー
Rails, Puma, MySQLとNginxをDockerコンテナに乗せて、EC2インスタンス内でdocker-compose upをしています。ローカルでpush後、mergeされたら、EC2への自動デプロイをCircleCIで行います。<br>httpsは、Route53(DNS),ALBを経由して、EC2にアクセスさせるようにしています。SSL証明書は、ACMで発行しています。




![good](https://user-images.githubusercontent.com/57794648/113692540-9a592c80-9708-11eb-871f-0d6272ce06b3.png)

<br>


# 機能一覧
・CRUD機能(User,Post)<br>
・ソート（人気、新着、view数順でそれぞれ表示）<br>
・ゲストログイン<br>
・ゲストログインを編集させない<br>
・投稿数の表示<br>
・いいねした数の表示<br>
・画像アップロード(gem 'carrierwave')<br>
・いいね(非同期)<br>
・Paginate(hem 'kaminari')<br>
・返信/コメント<br>
・続きを読む<br>
・impression数(gem 'impressionist')<br>
・タグ(記事内にハッシュタグで表示)<br>
・タグ一覧<br>
・検索<br>
・API(gem 'json')<br>
 &nbsp; &nbsp;・ベルリンの天気API<br>
 &nbsp; &nbsp;・ベルリンの気温API<br>
 &nbsp; &nbsp;・ドイツのニュースAPI

<br>

# 使用技術
・Ruby 2.6.6<br>
・Ruby on Rails 6.1.0<br>
・MySQL 8.0<br>
・Nginx<br>
・Puma<br>
・AWS(EC2,Route53,ACM,ALB)<br>
・Docker<br>
・CircleCi CI/CD<br>
・RSpec<br>
・Weather API<br>
・News API

<br>

## ブログを書きました。
[!Rails, Docker, AWS, CircleCIでポートフォリオを作成したので、振り返ってみる。](https://qiita.com/kazumawada/items/f8fcbf076e8672d51e12)


## アップデート中のもの

[バグ](https://github.com/kazumawada/myapp/issues/142#issue-821933525)

[アップデート中の機能 1](https://github.com/kazumawada/myapp/issues/143#issue-822792867)

[アップデート中の機能 2](https://github.com/kazumawada/myapp/issues/146#issue-823820013)

<br>

## 各種リンク

[Qiita](https://qiita.com/kazumawada)

[技術ブログ](https://kazumawada.hateblo.jp/)

## Usage

```
docker-compose build
docker-compose up -d
docker-compose run app bundle install
docker-compose run app bin/rails db:create
docker-compose run app bin/rails db:migrate
docker-compose run app bin/rails db:seed
docker-compose run app bin/rails webpacker:install
docker-compose run app bin/webpack-dev-server
```


