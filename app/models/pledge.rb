class Pledge < ApplicationRecord
  belongs_to :sponsor

  has_many :perk_pledges, :dependent => :destroy
  has_many :perks, :through => :perk_pledges

  validates :level, :presence => true
  validates :pledge_type, :presence => true

  enum level: [:spectator, :bronze, :silver, :gold, :platinum, :cohost]
  enum pledge_type: [:monetary, :inkind, :both]

  before_save :assign_perks_for_level, :on => :create

  private
  def assign_perks_for_level
    Perk.where("level <= ?", Pledge.levels[self.level]).each { |perk| self.perks << perk }
  end
end
