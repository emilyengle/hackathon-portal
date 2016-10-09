class CreatePerkSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :perk_sponsors do |t|
      t.belongs_to :perk, foreign_key: true
      t.belongs_to :sponsor, foreign_key: true

      t.timestamps
    end
  end
end
