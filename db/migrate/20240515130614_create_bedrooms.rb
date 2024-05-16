class CreateBedrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :bedrooms do |t|
      t.string :bedroom_type
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
