class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, null:false
      t.string :text
      t.string :image

      t.timestamps null:false
    end
  end
end
