class AddCoordinatesToManagers < ActiveRecord::Migration[7.1]
  def change
    add_column :managers, :latitude, :float
    add_column :managers, :longitude, :float
  end
end
