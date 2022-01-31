
class User < ApplicationRecord
    # hash password
    has_secure_password

    # email validation
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

    # validation
    validates :name, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, :on => :create, :allow_blank => true }
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, :on => :update, :allow_blank => true }
    validates :password, presence: true, length: { minimum: 8, maximum: 255 }, :on => :create, :allow_blank => true
    validates :password, presence: true, length: { minimum: 8, maximum: 255 }, :on => :update, :allow_blank => true
    validates :role_id, presence: true
    validates_confirmation_of :password, :on => :create, :allow_blank => true

    # pagination
    paginates_per 10

    # one to many with posts
    has_many :posts

    # belongs to role
    belongs_to :role

    # csv import
    def self.import(file)
      CSV.foreach(file, headers: true) do |row| # loop for row in the csv file
        columns = ActionController::Parameters.new(row.to_hash) # get column name 
        if row["action"] === "update" && row["id"] # if action is update
          begin
            updateUser = User.find_by_id(row["id"]) # find id and update this row
            updateUser.update! (columns.permit(:name, :email, :password, :role_id))
          rescue ActiveRecord::RecordInvalid => invalid
            return invalid.record.errors.full_messages # if validation error get, return this message
          end
        elsif row["action"] === "delete" && row["id"] # if action is delete
          begin
            deleteUser = User.find_by_id(row["id"]) # find id and delete if this id is exist in the table
            deleteUser.delete unless !deleteUser
          end
        else # create the row
          begin
            User.create! (columns.permit(:name, :email, :password, :role_id))
          rescue ActiveRecord::RecordInvalid => invalid
            return invalid.record.errors.full_messages # if validation error get, return this message
          end
        end
      end
    end 
end
