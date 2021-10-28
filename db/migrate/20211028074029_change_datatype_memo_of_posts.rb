class ChangeDatatypeMemoOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :memo, :text
  end
end
