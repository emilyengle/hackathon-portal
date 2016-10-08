class CreateSponsorTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsor_tasks do |t|
      t.belongs_to :task, foreign_key: true
      t.belongs_to :sponsor, foreign_key: true

      t.timestamps
    end
  end
end
