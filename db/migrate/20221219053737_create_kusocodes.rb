class CreateKusocodes < ActiveRecord::Migration[5.2]
  def change
    create_table :kusocodes do |t|
      t.text :code, null: false, limit: 65535
      t.string :description, limit: 255
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
