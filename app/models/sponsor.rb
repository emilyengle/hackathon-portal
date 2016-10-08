require 'securerandom'
class Sponsor < ApplicationRecord
  before_validation :set_registration_password, :on => :create


  has_many :pledges, :dependent => :destroy
  accepts_nested_attributes_for :pledges, :allow_destroy => true
  validates :name, :presence => true
  validates :registration_password, :presence => true


  private 
	  def set_registration_password
		self.registration_password = SecureRandom.hex(20)
	  end
end
