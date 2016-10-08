class Sponsor < ApplicationRecord
  has_many :pledges, :dependent => :destroy
  has_many :sponsor_tasks
  has_many :tasks, :through => :sponsor_tasks

  validates :name, :presence => true
  validates :registration_password, :presence => true
end
