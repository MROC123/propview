class CreateManagers < ActiveRecord::Migration[7.1]
  def change
    create_table :managers do |t|
      t.text :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
