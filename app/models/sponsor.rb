require 'securerandom'
class Sponsor < ApplicationRecord
  before_validation :set_registration_password, :on => :create

	has_many :sponsor_users
  has_many :sponsor_tasks
  has_many :tasks, :through => :sponsor_tasks
  has_many :pledges, :dependent => :destroy
  has_many :contacts, -> { where(:role => :sponsor) }, :source => :user, :through => :sponsor_users

  validates :name, :presence => true
  validates :registration_password, :presence => true

  def primary_assignee
  	su = self.sponsor_users.where(:role => SponsorUser.roles[:primary]).distinct.first
  	su.user unless su.nil?
  end

  def secondary_assignee
  	su = self.sponsor_users.where(:role => SponsorUser.roles[:secondary]).distinct.first.user
  	su.user unless su.nil?
  end

  def primary_assignee=(user)
  	current = primary_assignee

  	if current
  		SponsorUser.where(sponsor: self, user: current, role: SponsorUser.roles[:primary]).distinct.first.destroy
  	end

		su = SponsorUser.new(sponsor: self, user: user, role: SponsorUser.roles[:primary])
		su.save
  end

  def secondary_assignee=(user)
  	current = secondary_assignee

  	if current
  		SponsorUser.where(sponsor: self, user: current, role: SponsorUser.roles[:secondary]).distinct.first.destroy
  	end

		su = SponsorUser.new(sponsor: self, user: user, role: SponsorUser.roles[:secondary])
		su.save
  end

  private 
	def set_registration_password
		self.registration_password = SecureRandom.hex(20)
	end
end