class CreatePerkPledges < ActiveRecord::Migration[5.0]
  def change
    create_table :perk_pledges do |t|
      t.belongs_to :perk, foreign_key: true
      t.belongs_to :pledge, foreign_key: true

      t.timestamps
    end
  end
end
