class CreatePosts < ActiveRecord::Migration[6.1]
  def up
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :status, default: true
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
