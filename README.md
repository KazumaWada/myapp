## Usage

```
docker-compose build
docker-compose up -d
docker-compose run app bin/rails db:create
docker-compose run app bin/rails db:migrate
docker-compose run app bin/rails db:seed
docker-compose run app bin/rails webpacker:install
```
http://localhost/ 

## ベルリンなう
ベルリンにまつわることを共有するサービスです。

## URL
 http://35.72.202.115/ 「かんたんログイン」を使って下さい。

![FireShot Capture 064 - ベルリンなう - localhost](https://user-images.githubusercontent.com/57794648/110725759-74508180-825b-11eb-9a57-c31f9e757e80.png)

<br><br>

## クラウドアーキテクチャー
Rails, Puma, MySQLとNginxをDockerコンテナに乗せて、EC2インスタンス内でdocker-compose upをしています。


![cloud-architect](https://user-images.githubusercontent.com/57794648/110573294-5a9d3480-819e-11eb-8c83-e259f971a50f.png)

<br>


## 機能一覧
・CRUD機能(User,Post)<br>
・ソート（人気、新着、view数順でそれぞれ表示）<br>
・ゲストログイン<br>
・ゲストログインを編集させない<br>
・投稿数の表示<br>
・いいねした数の表示<br>
・画像アップロード(gem 'carrierwave')<br>
・いいね<br>
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

## 使用技術
・Ruby 2.6.6<br>
・Ruby on Rails 6.1.0<br>
・MySQL 8.0<br>
・Nginx<br>
・Puma<br>
・AWS(EC2)<br>
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


