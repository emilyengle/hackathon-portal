class Pledge < ApplicationRecord
  belongs_to :sponsor

  validates :level, :presence => true
  validates :pledge_type, :presence => true

  enum level: [:spectator, :bronze, :silver, :gold, :platinum, :cohost]
  enum pledge_type: [:monetary, :inkind, :both]

  
end
