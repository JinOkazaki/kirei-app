## アプリケーション名
KIREI

## アプリケーション概要
10~40代の学生から会社勤めの男性をターゲットにした男性向けの美容情報共有サービスです。 おすすめ商品、お気に入り商品を画像付きで投稿することができてユーザーが情報を共有することができます。 

## 本番環境
URL:http://35.76.224.126  

テスト用アカウント  
メールアドレス:test6@test.com  
パスワード:test66  

## 制作背景
- 市場状況  
2021年 20～59歳の男性1373名を対象  
[![Image from Gyazo](https://i.gyazo.com/48a5fb2cef70c679c1f8210d3c045310.png)](https://gyazo.com/48a5fb2cef70c679c1f8210d3c045310)  
全体で52.2%、10〜20代に絞ると約7割の男性が美容に興味がある。
30〜50代の男性でも45.2%の男性が美容に興味があるとデータに出ています。
このようにメンズ美容市場は高まっています。 

- 市場課題  
  #### 誰に聞けば良いのか分からない  
  #### 何をどうしたら良いのか分からない  
  下記調査結果のように美容に関心のある男性はどんなサービスを頼って良いのか分からず、迷子状態にある事が課題だと思いました。

[![Image from Gyazo](https://i.gyazo.com/f716aefabbe0ddc5bd4ac3c5385827e1.jpg)](https://gyazo.com/f716aefabbe0ddc5bd4ac3c5385827e1)    
  
そこで、これらの課題を解決できる男性向け美容情報共有アプリケーションを開発しました。  
ユーザーがした投稿を見る事で、投稿で気になったものがあったら直接ユーザーへチャット機能を使って聞く事ができることで迷子状態から抜け出せる事ができます。
## DEMO
### 新規登録画面  
![d95da1e7741d32fd0948b7c5c0260ec7](https://user-images.githubusercontent.com/89967312/139037820-cbef208c-0f07-4afd-822e-04f2a69af040.gif)  

* 適切な情報を入力することで新規登録ができます。
* ログインしてないとできない事  
  * 新規投稿
  * コメント機能  
  * いいね機能  
  * フォロー機能  
  * チャット機能  
  * ユーザーマイページへの遷移 

### トップページ(投稿一覧画面)　　
![867cfc6a57895467184975dfb7059eba](https://user-images.githubusercontent.com/89967312/139037491-3cf10da1-d627-450b-af80-6ef40b028978.gif)  

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
![70e057801e8a78550bb9cf5144a86eb8](https://user-images.githubusercontent.com/89967312/139038277-e333f96b-69de-4803-b3e8-b13ecb2af823.gif)  
[![Image from Gyazo](https://i.gyazo.com/e3999a1453b0b483f606ffccb08fa583.gif)](https://gyazo.com/e3999a1453b0b483f606ffccb08fa583)  
[![Image from Gyazo](https://i.gyazo.com/ca4a7e6f545002afbf4652295b4646de.gif)](https://gyazo.com/ca4a7e6f545002afbf4652295b4646de)  
* ヘッダーのメニューにあるマイページをクリックするとマイページに遷移できます。  
* 自分の投稿の一覧を見ることができます。  
* 自分がいいねした投稿の一覧を見ることができます。
* フォロー一覧を見ることができます。  
* フォロワー一覧を見ることができます。
* 自分がチャットをした事があるユーザーの一覧を見る事ができます。  
### 他ユーザーのマイページ  
[![Image from Gyazo](https://i.gyazo.com/7d7714e4c4e3e0c0b21701d0eeb6c6c1.gif)](https://gyazo.com/7d7714e4c4e3e0c0b21701d0eeb6c6c1)  
[![Image from Gyazo](https://i.gyazo.com/f68592c3c9a520950a832d84259a25d8.gif)](https://gyazo.com/f68592c3c9a520950a832d84259a25d8)  
* ユーザーの投稿一覧を見ることができます。  
* ユーザーがいいねした投稿の一覧を見ることができます。  
* 他ユーザーのマイページにあるフォローボタンを押すとフォロー、フォローの取り消しができます。  
* 他ユーザーのマイページにあるチャットボタンを押すとチャットができます。  
### レスポンシブ対応  

![106e626f66aee8e24f4e6bab0878805b](https://user-images.githubusercontent.com/89967312/139036806-2633e7e6-10f4-4ab5-95b9-f88c80e09d96.gif)  


* 画面サイズによってヘッダーのメニューをハンバーガメニューにまとめました。  
## 工夫したポイント
* 実際の開発現場を想定し機能ごとにブランチを切りプッシュも作業ごとに実施しました。
* Ajaxを用いた実装をなるべくしてアプリケーションのパフォーマンスを向上させました。
* 各端末でも利用できるようレスポンシブ対応にしました。  
* 男性が使っていても違和感がない、かつオシャレなデザインになるように心がけました。
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