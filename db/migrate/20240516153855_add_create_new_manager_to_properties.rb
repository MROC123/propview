class AddCreateNewManagerToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :create_new_manager, :boolean
  end
end
