class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.references :user, foreign_key: true
      t.references :kusocode, foreign_key: true
      t.index [:user_id, :kusocode_id], unique: true

      t.timestamps
    end
  end
end
