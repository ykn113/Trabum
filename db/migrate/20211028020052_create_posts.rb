class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :continent_id, null: false
      t.string :image_id, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.string :memo
      t.string :flight
      t.timestamps
    end
  end
end
