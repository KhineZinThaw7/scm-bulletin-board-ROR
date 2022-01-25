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

  # csv import
  def self.import(file)
    CSV.foreach(file, headers: true) do |row| # loop for row in the csv file
      columns = ActionController::Parameters.new(row.to_hash) # get column name 
      if row["action"] === "update" && row["id"] # if action is update
        begin
          updatePost = Post.find(row["id"]) # find id and update this row
          updatePost.update! (columns.permit(:title, :description, :user_id, :category_id))
        rescue ActiveRecord::RecordInvalid => invalid
          return invalid.record.errors.full_messages # if validation error get, return this message
        end
      elsif row["action"] === "delete" && row["id"] # if action is delete
        begin
          deletePost = Post.find_by_id(row["id"]) # find id and delete if this id is exist in the table
          deletePost.delete unless !deletePost
        end
      else # create the row
        begin
          Post.create! (columns.permit(:title, :description, :user_id, :category_id))
        rescue ActiveRecord::RecordInvalid => invalid
          return invalid.record.errors.full_messages # if validation error get, return this message
        end
      end
    end
  end 

end

