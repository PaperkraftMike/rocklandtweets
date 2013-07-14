class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.datetime :created_at
      t.integer :zip 
      t.string :password
      t.string :email
      t.integer :user_id
    end
  end

  def down
    drop_table :posts
  end
end
