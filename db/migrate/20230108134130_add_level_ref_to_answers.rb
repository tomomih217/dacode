class AddLevelRefToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :level, foreign_key: true
  end
end
