class Task < ApplicationRecord
  validates :name, :presence => true

  has_many :sponsor_tasks
  has_many :sponsors, :through => :sponsor_tasks
end
