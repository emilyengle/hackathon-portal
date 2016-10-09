class AddFieldsToSponsor < ActiveRecord::Migration[5.0]
  def change
    add_column :sponsors, :contact_first_name, :string
    add_column :sponsors, :contact_last_name, :string
    add_column :sponsors, :contact_email, :string
    add_column :sponsors, :contact_information_received, :boolean, :default => false
    add_column :sponsors, :challenge, :text
    add_column :sponsors, :challenge_received, :boolean, :default => false
    add_column :sponsors, :prehype_event, :text
    add_column :sponsors, :prehype_event_received, :boolean, :default => false
    add_column :sponsors, :swag, :text
    add_column :sponsors, :swag_received, :boolean, :default => false
  end
end
