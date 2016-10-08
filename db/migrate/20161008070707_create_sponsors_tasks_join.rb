class CreateSponsorsTasksJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors_tasks, :id => false do |t|
    	t.column 'sponsor_id', :integer
    	t.column 'task_id', :integer
    end
  end
end
