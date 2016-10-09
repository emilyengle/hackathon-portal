class ChangePhoneNumberToNotRequired < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :phone_number, :integer, :null => true, :limit => 8
  end
end
