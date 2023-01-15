class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :quiz_id, null: false
      t.string :currect_answer, null: false

      t.timestamps
    end
  end
end
