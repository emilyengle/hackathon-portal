class CreateSponsorUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsor_users do |t|
      t.belongs_to :sponsor, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :role, :null => false

      t.timestamps
    end
  end
end
