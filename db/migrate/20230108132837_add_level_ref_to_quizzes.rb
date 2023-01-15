class AddLevelRefToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :level, foreign_key: true
  end
end
