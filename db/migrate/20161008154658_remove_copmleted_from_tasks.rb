class RemoveCopmletedFromTasks < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tasks, :copmleted
  end
end
