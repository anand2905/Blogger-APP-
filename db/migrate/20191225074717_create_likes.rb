class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :like
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
