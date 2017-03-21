class AddUserIdToTobuys < ActiveRecord::Migration
  def change
    add_column :tobuys, :user_id, :integer
  end
end
