class Record < ApplicationRecord
  belongs_to :user
  belongs_to :level

  validates :user_id, uniqueness: { scope: :level_id }
  enum status: { challenge: 0, giveup: 1, cleared: 2, trial: 3 }

  def change_status(status_param)
    return if status.trial?
    case status_param
    when 'CLEAR!'
      cleared!
    when 'ギブアップ'
      giveup!
    end
  end
end
