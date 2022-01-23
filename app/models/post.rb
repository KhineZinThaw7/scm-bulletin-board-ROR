class Post < ApplicationRecord
  paginates_per 10

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true

  belongs_to :user
  belongs_to :category
  has_one_attached :image
end

