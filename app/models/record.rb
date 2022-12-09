class Record < ApplicationRecord
  belongs_to :user
  belongs_to :level

  enum status: { challenge: 0, giveup: 1, cleared: 2 }
end
