class CreateDislikes < ActiveRecord::Migration[5.2]
  def change
    create_table :dislikes do |t|
      t.string :dislike
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
