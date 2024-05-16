class AddNotNullConstraintToUserIdInProperties < ActiveRecord::Migration[7.1]
  def change
    change_column_null :properties, :user_id, false
  end
end
