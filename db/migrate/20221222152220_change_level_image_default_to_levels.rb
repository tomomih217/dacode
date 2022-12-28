class ChangeLevelImageDefaultToLevels < ActiveRecord::Migration[5.2]
  def change
    change_column_default :levels, :level_image, from: 'level_noimage.jpg', to: '/images/level_noimage.jpg'
  end
end
