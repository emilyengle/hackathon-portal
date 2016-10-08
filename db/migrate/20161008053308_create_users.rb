class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :username, :null => false
      t.string :password_digest, :null => false
      t.integer :phone_number
      t.integer :user_type, :null => false, :default => 0

      t.timestamps
    end
  end
end
