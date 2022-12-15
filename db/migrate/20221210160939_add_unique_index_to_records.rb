class AddUniqueIndexToRecords < ActiveRecord::Migration[5.2]
  def change
    add_index :records, [:user_id, :level_id], unique: true
  end
end
