class CreatePledges < ActiveRecord::Migration[5.0]
  def change
    create_table :pledges do |t|
      t.integer :level, :null => false
      t.integer :pledge_type, :null => false, :default => 0
      t.integer :amount_pledged
      t.integer :amount_paid
      t.string :inkind_pledged
      t.string :inkind_received
      t.belongs_to :sponsor, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
