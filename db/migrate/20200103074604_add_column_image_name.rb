class AddColumnImageName < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:image_column,:string
  end
end
