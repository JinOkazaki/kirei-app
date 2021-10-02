class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :post

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :caption
    validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  end
end
