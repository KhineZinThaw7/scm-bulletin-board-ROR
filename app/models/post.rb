class Post < ApplicationRecord
  paginates_per 10

  validates :title, presence: true
  validates :description, presence: true
end

