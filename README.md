## アプリケーション名
KIREI

## アプリケーション概要








## usersテーブル
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

## relationshipsテーブル

|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|following_id       |integer|null: false              |
|follower_id        |integer|null: false              |

### Association
- belongs_to :following, class_name: "User"
- belongs_to :following, class_name: "User"

 ## postsテーブル

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

## commentsテーブル

|Column             |Type     |Options                       |
|-------------------|---------|------------------------------|
|text               |text     |null, false                   |
|user               |reference|null: false, foreign_key: true|
|post               |reference|null: false, foreign_key: true|

### Association
- belongs_to  :user
- belongs_to  :post

## likesテーブル

|Column             |Type     |Options                       |
|-------------------|---------|------------------------------|
|user               |reference|null: false, foreign_key: true|
|post               |reference|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :post


## roomsテーブル

|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|room_name          |string    |null: false                   |

## Association
- has_many :user, through: :user
- has_many :messages

## user_roomsテーブル

|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|user               |reference |null: false, foreign_key: true|
|room               |reference |null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :room

## messagesテーブル

|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|content            |string    |null: false                   |
|user               |reference |null: false, foreign_key: true|
|room               |reference |null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :room