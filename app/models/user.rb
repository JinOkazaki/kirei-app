class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  has_many :message, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  

  with_options presence: true do
    validates :nickname
    validates :age, format: {with: /\A[0-9]{2,3}\z/}
    validates :gender_id, numericality: {other_than: 1, message: "can't be blank"}
  end
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers."}
  
  def liked_by?(post)
    self.likes.exists?(post_id: post.id)
  end

  def followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end
end
