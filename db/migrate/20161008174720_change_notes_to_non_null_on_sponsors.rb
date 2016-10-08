class ChangeNotesToNonNullOnSponsors < ActiveRecord::Migration[5.0]
  def change
  	change_column :sponsors, :notes, :text, :null => false
  end
end
