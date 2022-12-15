class Record < ApplicationRecord
  belongs_to :user
  belongs_to :level

  validates :user_id, uniqueness: { scope: :level_id }
  enum status: { challenge: 0, giveup: 1, cleared: 2, trial: 3 }

  def change_status(status)
    case status
    when 'クリア'
      cleared!
    when 'ギブアップ'
      giveup!
    end
  end
end
