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

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      parameters = ActionController::Parameters.new(row.to_hash)
      if row["action"] === "update" && row["id"]
        begin
          updatePost = Post.find(row["id"])
          updatePost.update! (parameters.permit(:title, :description, :user_id, :category_id))
        rescue ActiveRecord::RecordInvalid => invalid
          return invalid.record.errors.full_messages
        end
      elsif row["action"] === "delete" && row["id"]
        begin
          deletePost = Post.find_by_id(row["id"])
          deletePost.delete unless !deletePost
        end
      else
        begin
          Post.create! (parameters.permit(:title, :description, :user_id, :category_id))
        rescue ActiveRecord::RecordInvalid => invalid
          return invalid.record.errors.full_messages
        end
      end
    end
  end 

end

