## アプリケーション名
KIREI

## アプリケーション概要
10~30代をターゲットにした男性向けのコスメ、美容情報共有サービスです。
おすすめ商品、お気に入り商品を画像付きで投稿することができてユーザーが情報を共有することができます。

## 本番環境
URL: 35.76.224.126

## 制作背景
2021年 20～59歳の男性1373名を対象
[![Image from Gyazo](https://i.gyazo.com/48a5fb2cef70c679c1f8210d3c045310.png)](https://gyazo.com/48a5fb2cef70c679c1f8210d3c045310)  
[![Image from Gyazo](https://i.gyazo.com/a14898443c1232f498f5379f06da256e.png)](https://gyazo.com/a14898443c1232f498f5379f06da256e)  
図のように近年美容に関心のある男性は増え続けています。また、関心はあるが適切なスキンケア方法が分からない男性がほとんどです。これらの課題を解決するためにこのようなアプリケーションを制作をしました。

## DEMO
### 新規登録画面  
[![Image from Gyazo](https://i.gyazo.com/47f735e57a316c925c101ab2569b0348.gif)](https://gyazo.com/47f735e57a316c925c101ab2569b0348)  
* 適切な情報を入力することで新規登録ができます。
* ログインしてないとできない事  
  * 新規投稿
  * コメント機能  
  * いいね機能  
  * フォロー機能  
  * チャット機能  
  * ユーザーマイページへの遷移 

### トップページ(投稿一覧画面)
[![Image from Gyazo](https://i.gyazo.com/933d52e2e51edb988ff9cdd2a1503a18.gif)](https://gyazo.com/933d52e2e51edb988ff9cdd2a1503a18)  
* トップページから投稿の一覧を見ることができます。  
* 投稿についているハート型のボタンを押すといいねができます。  
* 投稿者をクリックするとそのユーザーのマイページに遷移できます。  

### 投稿詳細ページ  
[![Image from Gyazo](https://i.gyazo.com/1fbb4f8bae025c51e1d57f1e6180dab3.gif)](https://gyazo.com/1fbb4f8bae025c51e1d57f1e6180dab3)  
* 投稿画像をクリックすると詳細ページに遷移できます。  
* 投稿の編集、削除ができます。  
  * 他ユーザーの詳細ページには編集、削除ボタンは表示されません。  
* 投稿にコメントができます。  
### マイページ  
[![Image from Gyazo](https://i.gyazo.com/70e057801e8a78550bb9cf5144a86eb8.gif)](https://gyazo.com/70e057801e8a78550bb9cf5144a86eb8)[![Image from Gyazo](https://i.gyazo.com/e3999a1453b0b483f606ffccb08fa583.gif)](https://gyazo.com/e3999a1453b0b483f606ffccb08fa583)[![Image from Gyazo](https://i.gyazo.com/ca4a7e6f545002afbf4652295b4646de.gif)](https://gyazo.com/ca4a7e6f545002afbf4652295b4646de)  
* ヘッダーのメニューにあるマイページをクリックするとマイページに遷移できます。  
* 自分の投稿の一覧を見ることができます。  
* 自分がいいねした投稿の一覧を見ることができます。
* フォロー一覧を見ることができます。  
* フォロワー一覧を見ることができます。
* 自分がチャットをした事があるユーザーの一覧を見る事ができます。  
### 他ユーザーのマイページ  
[![Image from Gyazo](https://i.gyazo.com/7d7714e4c4e3e0c0b21701d0eeb6c6c1.gif)](https://gyazo.com/7d7714e4c4e3e0c0b21701d0eeb6c6c1)[![Image from Gyazo](https://i.gyazo.com/f68592c3c9a520950a832d84259a25d8.gif)](https://gyazo.com/f68592c3c9a520950a832d84259a25d8)  
* ユーザーの投稿一覧を見ることができます。  
* ユーザーがいいねした投稿の一覧を見ることができます。  
* 他ユーザーのマイページにあるフォローボタンを押すとフォロー、フォローの取り消しができます。  
* 他ユーザーのマイページにあるチャットボタンを押すとチャットができます。  
### レスポンシブ対応  
[![Image from Gyazo](https://i.gyazo.com/4f812e17f5f65f0f87df685dff3d0da9.gif)](https://gyazo.com/4f812e17f5f65f0f87df685dff3d0da9)  
* 画面サイズによってヘッダーのメニューをハンバーガメニューにまとめました。  
## 工夫したポイント
* 実際の開発現場を想定し機能ごとにブランチを切りプッシュも作業ごとに実施しました。
* Ajaxを用いた実装をなるべくしてアプリケーションのパフォーマンスを向上させました。
* ペルソナの該当がスマホ世代の男性だったのでスマホ画面にも対応させました。  
## 使用技術(開発環境)
### バックエンド  
Ruby, Ruby on Rails  
### フロントエンド  
HTML, CSS, JavaScript, JQuery  
### データベース  
MySQL, Sequel Pro  
### インフラ  
AWS(EC2, S3), Capistrano  
### Webサーバー(本番環境)  
nginx  
### アプリケーションサーバー(本番環境)  
unicorn  
### ソース管理  
GitHub, GitHubDesktop  
### テスト  
RSpec  
## 今後実装したい機能  
* 通知機能  
  * コメント通知
  * フォロー通知
  * チャットメッセージ通知  
## データベース設計  

### usersテーブル
|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false              |
|email              |string |null: false, unique: true|
|encrypted_password |string |null: false              |
|age                |integer|null: false              |
|gender_id          |integer|null: false              |


### Association
- has_many :posts
- has_many :comments
- has_many :messages
- has_many :rooms, through: :user_rooms
- has_many :relationships, foreign_key: :following_id
- has_many :followings, through: :relationship, source: :follower
- has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :reverse_of_relationships, source: :following

### relationshipsテーブル

|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|following_id       |integer|null: false              |
|follower_id        |integer|null: false              |

### Association
- belongs_to :following, class_name: "User"
- belongs_to :following, class_name: "User"

 ### postsテーブル

|Column                 |Type     |Options                       |
|-----------------------|---------|------------------------------|
|caption                |text     |null: false                   |
|category_id            |integer  |null: false                   |
|user                   |reference|null: false, foreign_key: true|


### Association
- belongs_to  :user
- has_many  :comments
- has_many  :likes
- has_many  :tags, through: :post_tags

### commentsテーブル

|Column             |Type     |Options                       |
|-------------------|---------|------------------------------|
|text               |text     |null, false                   |
|user               |reference|null: false, foreign_key: true|
|post               |reference|null: false, foreign_key: true|

### Association
- belongs_to  :user
- belongs_to  :post

### likesテーブル

|Column             |Type     |Options                       |
|-------------------|---------|------------------------------|
|user               |reference|null: false, foreign_key: true|
|post               |reference|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :post


### roomsテーブル

|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|room_name          |string    |null: false                   |

## Association
- has_many :user, through: :user
- has_many :messages

### user_roomsテーブル

|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|user               |reference |null: false, foreign_key: true|
|room               |reference |null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :room

### messagesテーブル

|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|content            |string    |null: false                   |
|user               |reference |null: false, foreign_key: true|
|room               |reference |null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :room