class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,null:false 
      t.string :email,null:false ,unique: true
      t.string :nickname,null:false 
      t.string :user_image
      t.string :password,null:false 
      t.timestamps null: false
    end
  end
end
