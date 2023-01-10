class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  validates :user_id, uniqueness: {scope: :quiz_id}

  # 回答の文字数が一致するか判定
  def currect_len?
    answer.length == quiz.currect_answer.length
  end

  # 答えが合っているか判定
  def currect?
    answer == quiz.currect_answer
  end
end
