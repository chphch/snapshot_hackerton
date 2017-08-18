class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user

      t.string :title
      t.integer :price
      t.datetime :date
      t.string :url
      t.string :image
      t.string :shopping_mall

      t.timestamps
    end
  end
end
