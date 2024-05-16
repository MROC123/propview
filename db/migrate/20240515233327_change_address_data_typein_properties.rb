class ChangeAddressDataTypeinProperties < ActiveRecord::Migration[7.1]
  def change
    change_column :properties, :address, :string
  end
end
