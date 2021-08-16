
[![<ORG_NAME>](https://circleci.com/gh/kazumawada/myapp.svg?style=svg)](https://app.circleci.com/pipelines/github/kazumawada/myapp)

# ベルリンなう https://berlin-now.net(現在サーバー停止) 
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
・投稿数の表示<br>
・いいねした数の表示<br>
・画像アップロード(gem 'carrierwave')<br>
・いいね(非同期)<br>
・Paginate(hem 'kaminari')<br>
・返信/コメント<br>
・続きを読む<br>
・impression数(gem 'impressionist')<br>
・タグ(記事内にハッシュタグで表示, トップページのサイドバーに一覧表示)<br>
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

# 全体のスクリーンショット

#### root
![FireShot Capture 163 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115528909-69165a00-a2cd-11eb-9e27-ef7fa2fb02a3.png)

#### users/:id
![FireShot Capture 164 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115529032-86e3bf00-a2cd-11eb-8a2b-d30db81d9838.png)

#### users/:id/following
![FireShot Capture 165 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115529261-b72b5d80-a2cd-11eb-9b8f-3d6d5fbb9f89.png)


#### users/:id/followed
![FireShot Capture 166 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115529319-c3afb600-a2cd-11eb-9763-340c3f327504.png)

#### /users
![FireShot Capture 167 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115529414-da560d00-a2cd-11eb-84f4-0fea36534ef3.png)

#### /posts/:id, /posts/:id/search?search=検索ワード
![FireShot Capture 168 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115529528-f22d9100-a2cd-11eb-8a17-a4f7e84bef99.png)

#### 検索結果が見つからなかった場合
![FireShot Capture 173 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115531372-aaa80480-a2cf-11eb-9f7e-f3376cad189e.png)


#### /posts/hashtag/:name
![FireShot Capture 169 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115529747-1db07b80-a2ce-11eb-8ffc-275dba37454e.png)

#### /posts/new, /posts/edit
![FireShot Capture 170 - ベルリンなう - berlin-now net](https://user-images.githubusercontent.com/57794648/115529877-3d47a400-a2ce-11eb-97b7-b8121f9653b6.png)





