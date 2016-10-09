class PerkPledge < ApplicationRecord
  belongs_to :perk
  belongs_to :pledge
end
