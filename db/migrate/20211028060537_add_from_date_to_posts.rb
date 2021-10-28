class AddFromDateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :from_date, :date
    add_column :posts, :to_date, :date
  end
end
