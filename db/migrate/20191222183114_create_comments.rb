class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id

      t.bigint  :commentable_id
      t.string  :commentable_type

      t.timestamps
    end
  end
end
