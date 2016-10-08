class IncreaseIntegerLengthOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :phone_number, :integer, :limit => 8
  end
end
