class AddStatusToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :status, :integer, default: 0, null: false
  end
end
