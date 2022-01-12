class Post < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  paginates_per 10
end

