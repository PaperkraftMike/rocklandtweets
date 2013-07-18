class Users < ActiveRecord::Migration
  def up
  	create_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :password
  		t.integer :zipcode
  		t.datetime :created_at
  		t.integer :user_id
  	end
  end

  def down
  	drop_table :users
  end
end
