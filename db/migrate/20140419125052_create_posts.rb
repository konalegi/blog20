class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :full_text, :limit => 5000
      t.string :preview, :limit => 1000
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
