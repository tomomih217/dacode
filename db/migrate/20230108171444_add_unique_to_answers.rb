class AddUniqueToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_index :answers, [:user_id, :quiz_id], unique: true
  end
end
