class ChangeUserNullableInManagers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :managers, :user_id, true
  end
end
