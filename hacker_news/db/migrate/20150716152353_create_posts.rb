class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      #ZM: Set a default value on votes
      t.integer :votes
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
