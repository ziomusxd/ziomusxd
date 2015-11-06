class ChandeTypeWzs < ActiveRecord::Migration
  def change
    change_column :wzs, :admin_user_id,  :string
  end
end
