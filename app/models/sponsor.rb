class Sponsor < ApplicationRecord
  has_secure_password

  validates :name, :presence => true
  validates :registration_password, :presence => true

end
