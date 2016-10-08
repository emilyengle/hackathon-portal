class SponsorTask < ApplicationRecord
  belongs_to :task
  belongs_to :sponsor
end
