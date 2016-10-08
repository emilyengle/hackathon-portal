class AddCompletedToSponsorTasks < ActiveRecord::Migration[5.0]
  def change
  	add_column :sponsor_tasks, :completed, :boolean, :default => false
  end
end
