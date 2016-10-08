class Sponsor < ApplicationRecord
  has_many :pledges, :dependent => :destroy
  validates :name, :presence => true
  validates :registration_password, :presence => true
end
