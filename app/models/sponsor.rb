class Sponsor < ApplicationRecord

  validates :name, :presence => true
  validates :registration_password, :presence => true

end
