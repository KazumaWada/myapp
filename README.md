## ベルリンなう
ベルリンにまつわることを共有するサービスです。

## URL
http://35.72.202.115/


![FireShot Capture 055 - ベルリンなう - localhost](https://user-images.githubusercontent.com/57794648/110719957-1e76dc00-8251-11eb-9d45-6c02e7cf2f5e.png)

<br><br>

## クラウドアーキテクチャー
Rails,MySQL,PumaとNginxをDockerコンテナに乗せて、EC2インスタンス内でdocker-compose upをしています。


![cloud-architect](https://user-images.githubusercontent.com/57794648/110573294-5a9d3480-819e-11eb-8c83-e259f971a50f.png)

<br>


## 機能一覧
・CRUD機能(User,Post)<br>
・ソート（人気、新着、view数順でそれぞれ表示）
・ゲストログイン
・ゲストログインを編集させない<br>
・画像アップロード(CarrierWave)<br>
・いいね<br>
・返信/コメント<br>
・impression数(gem 'impressionist')<br>
・タグ(記事内にハッシュタグで表示)<br>
・検索<br>
・API(gem 'json')<br>
・天気API<br>
・気温API<br>
・時刻API<br>
・ニュースAPI

<br><br>

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

## アップデート中のもの

[バグ](https://github.com/kazumawada/myapp/issues/142)

[アップデート中の機能 1](https://github.com/kazumawada/myapp/issues/143)

[アップデート中の機能 2](https://github.com/kazumawada/myapp/issues/146)
