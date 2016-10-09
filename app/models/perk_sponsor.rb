class PerkSponsor < ApplicationRecord
  belongs_to :perk
  belongs_to :sponsor
end
