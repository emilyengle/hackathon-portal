class CreatePerks < ActiveRecord::Migration[5.0]
  def change
    create_table :perks do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.integer :level, :null => false, :default => 0

      t.timestamps
    end
  end
end
