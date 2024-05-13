class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :property, null: true, foreign_key: true
      t.references :manager, null: false, foreign_key: true
      t.text :pros
      t.text :cons
      t.text :advice
      t.float :rating
      t.date :start_date
      t.date :end_date
      t.float :service_charge
      t.float :rent
      t.text :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
