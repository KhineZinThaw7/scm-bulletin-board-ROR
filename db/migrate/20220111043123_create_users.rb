class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role_id, null: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
