class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, :null => false
      t.string :description
      t.boolean :copmleted, :default => false
      t.string :related_url

      t.timestamps
    end
  end
end
