class CreateSponsorTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsor_tasks do |t|

      t.timestamps
    end
  end
end
