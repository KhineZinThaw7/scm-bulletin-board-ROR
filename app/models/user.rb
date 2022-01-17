
class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 8, maximum: 255 }
    validates :email, presence: true,format: { with: VALID_EMAIL_REGEX }

    paginates_per 10
end
