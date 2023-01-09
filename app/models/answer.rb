class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  validates :user_id, uniqueness: {scope: :quiz_id}

  def currect_len?
    return answer.length == quiz.currect_answer.length
  end
end
