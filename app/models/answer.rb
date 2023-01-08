class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  def currect_len?
    return answer.length == quiz.currect_answer.length
  end
end
