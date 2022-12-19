class AddLevelImageToLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :level_image, :string, null: false
  end
end
