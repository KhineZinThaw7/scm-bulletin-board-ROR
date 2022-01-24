class Category < ApplicationRecord
    # validation
    validates :name, presence: true

    # one to many with posts
    has_many :posts
end
