class AddNewManagerFieldsToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :new_manager_name, :string
    add_column :properties, :new_manager_address, :string
  end
end
