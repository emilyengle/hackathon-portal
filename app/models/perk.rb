class Perk < ApplicationRecord
  has_many :perk_pledges, :dependent => :destroy
  has_many :pledges, :through => :perk_pledges

  validates :level, :presence => true

  validates :name, :presence => true

  validates :description, :presence => true

  enum level: [:spectator, :bronze, :silver, :gold, :platinum, :cohost]
end
