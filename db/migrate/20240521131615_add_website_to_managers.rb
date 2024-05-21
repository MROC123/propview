class AddWebsiteToManagers < ActiveRecord::Migration[7.1]
  def change
    add_column :managers, :website, :string
  end
end
