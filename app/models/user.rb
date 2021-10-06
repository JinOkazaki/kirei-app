class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  has_many :posts
  has_many :comments
  has_many :likes
  
  with_options presence: true do
    validates :nickname
    validates :age, format: {with: /\A[0-9]{2,3}\z/}
    validates :gender_id, numericality: {other_than: 1, message: "can't be blank"}
  end
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers."}
  
end
