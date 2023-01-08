class Quiz < ApplicationRecord
  validates :quiz_id, presence: true
  validates :currect_answer, presence: true

  has_many :answers, dependent: :destroy
end
