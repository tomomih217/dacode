class AddNotNullToDescriptionToKusocodes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :kusocodes, :description, false
  end
end
