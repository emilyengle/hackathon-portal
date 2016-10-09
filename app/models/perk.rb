class Perk < ApplicationRecord
  has_many :perk_pledges, :dependent => :destroy
  has_many :pledges, :through => :perk_pledges

  validates :level, :presence => true

  validates :name, :presence => true

  validates :description, :presence => true

  enum level: [:spectator, :bronze, :silver, :gold, :platinum, :cohost]

  after_create :assign_perks_for_level

  private
  def assign_perks_for_level
    Pledge.where("level >= ?", Perk.levels[self.level]).each { |pledge| pledge.perks << self }
  end
end
