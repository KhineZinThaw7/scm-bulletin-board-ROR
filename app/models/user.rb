
class User < ApplicationRecord
    # hash password
    has_secure_password

    # email validation
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

    # validation
    validates :name, presence: true
    validates :email, presence: true,format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 8, maximum: 255 }, :on => :create
    validates :password, presence: true, length: { minimum: 8, maximum: 255 }, :on => :update, :allow_blank => true

    # pagination
    paginates_per 10

    # one to many with posts
    has_many :posts

    # belongs to role
    belongs_to :role
end
