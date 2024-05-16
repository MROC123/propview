class AddQuantityToBedrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :bedrooms, :quantity, :integer
  end
end
