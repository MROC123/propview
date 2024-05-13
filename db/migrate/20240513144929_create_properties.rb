class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :address
      t.string :type
      t.string :bedrooms
      t.string :bathrooms
      t.references :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
