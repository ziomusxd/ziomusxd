class AddStatusIsToWzs < ActiveRecord::Migration
  def change
      add_column :wzs, :admin_user_id, :integer
      add_column :wzs, :status_id, :integer
  end
end
