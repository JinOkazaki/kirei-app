class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '洗顔料'},
    {id: 3, name: 'クレンジング'},
    {id: 4, name: '化粧水'},
    {id: 5, name: '乳液、美容液'},
    {id: 6, name: 'フェイスクリーム'},
    {id: 7, name: '日焼け対策、UVケア'},
    {id: 8, name: 'ベースメイク'},
    {id: 9, name: '香水、フレグランス'},
    {id: 10, name: 'ヘアケア、スタイリング'},
    {id: 11, name: '美容グッズ、美容家電'},
    {id: 12, name: 'サプリメント、フード'},
    {id: 13, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :posts
end