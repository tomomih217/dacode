class CreateKusocodes < ActiveRecord::Migration[5.2]
  def change
    create_table :kusocodes do |t|
      t.string :code, null: false, limit: 65_535
      t.string :description, limit: 255
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
