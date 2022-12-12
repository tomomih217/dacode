class Record < ApplicationRecord
  belongs_to :user
  belongs_to :level

  validates :user_id, uniqueness: { scope: :level_id }
  enum status: { challenge: 0, giveup: 1, cleared: 2, trial: 3 }

  def change_status(status)
    if status == 'クリア'
      self.cleared!
    elsif status == 'ギブアップ'
      self.giveup!
    end
  end
end
