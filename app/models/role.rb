class Role < ApplicationRecord
    # one to many with users
    has_many :users
end
