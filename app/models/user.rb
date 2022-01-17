
class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

    validates :name, presence: true
    validates :email, presence: true,format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 8, maximum: 255 }, :on => :create
    validates :password, presence: true, length: { minimum: 8, maximum: 255 }, :on => :update, :allow_blank => true

    paginates_per 10

    has_many :posts, dependent: :destroy
end
