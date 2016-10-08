class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :name, :null => false
      t.string :logo
      t.string :registration_password, :null => false
      t.boolean :active, :default => true
      t.string :inactive_reason
      t.integer :fiscal_year_start_month
      t.text :notes
    end
  end
end
