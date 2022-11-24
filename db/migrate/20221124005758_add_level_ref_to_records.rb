class AddLevelRefToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :level, foreign_key: true
  end
end
