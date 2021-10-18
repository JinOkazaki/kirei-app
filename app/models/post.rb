class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  has_many :notifications, dependent: :destroy

  with_options presence: true do
    validates :caption
    validates :image
    validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  end

end
