class Post < ApplicationRecord
  # pagination
  paginates_per 10

  # validation
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true

  # belongs to user
  belongs_to :user

  # belong to category
  belongs_to :category

  # has one relationship with image
  has_one_attached :image
end

