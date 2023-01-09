class RemoveLevelIdIndexFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :answers, :level, foreign_key: true
  end
end
