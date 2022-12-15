class RemoveResultFromRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :result, :string
  end
end
