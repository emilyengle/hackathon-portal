require 'securerandom'
class Sponsor < ApplicationRecord
  before_validation :set_registration_password, :on => :create

	has_many :sponsor_users
  has_many :sponsor_tasks, :dependent => :destroy
  has_many :tasks, :through => :sponsor_tasks
  has_many :pledges, :dependent => :destroy
  validates :name, :presence => true
  validates :registration_password, :presence => true
  accepts_nested_attributes_for :pledges, :allow_destroy => true

  def contacts
    self.sponsor_users.where(:role => SponsorUser.roles[:sponsor]).map { |su| su.user }
  end

  def add_contact(username)
    user = User.find_by_username username
    self.sponsor_users << SponsorUser.create(sponsor: self, user: user, role: :sponsor)
  end

  def primary_assignee
  	su = self.sponsor_users.where(:role => SponsorUser.roles[:primary]).distinct.first
  	su.user unless su.nil?
  end

  def secondary_assignee
  	su = self.sponsor_users.where(:role => SponsorUser.roles[:secondary]).distinct.first
  	su.user unless su.nil?
  end

  def primary_assignee=(username)
  	current = primary_assignee

  	if current
  		SponsorUser.where(sponsor: self, user: current, role: SponsorUser.roles[:primary]).distinct.first.destroy
  	end

    user = User.find_by_username username

    unless user.nil?
  		su = SponsorUser.new(sponsor: self, user: user, role: SponsorUser.roles[:primary])
	   	su.save
    end
  end

  def secondary_assignee=(username)
  	current = secondary_assignee

  	if current
  		SponsorUser.where(sponsor: self, user: current, role: SponsorUser.roles[:secondary]).distinct.first.destroy
  	end

		user = User.find_by_username username

    unless user.nil?
      su = SponsorUser.new(sponsor: self, user: user, role: SponsorUser.roles[:secondary])
      su.save
    end
  end

  private
	def set_registration_password
		self.registration_password = SecureRandom.hex(20)
	end
end
