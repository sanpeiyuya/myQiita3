class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:user_image,:string
    remove_column :users, :image_column,:string
  end
end
