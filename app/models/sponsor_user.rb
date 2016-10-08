class SponsorUser < ApplicationRecord
  belongs_to :sponsor
  belongs_to :user

  enum role: [:sponsor, :primary, :secondary]
end
