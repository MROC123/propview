class BackfillUserIdInProperties < ActiveRecord::Migration[7.1]
  def up
    Property.update_all(user_id: 62)
  end

  def down
  end
end
