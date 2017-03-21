class FixColumnName < ActiveRecord::Migration
  def self.up
      rename_column :adoptions, :admin_user_id, :user_id
    end

    def self.down
      rename_column :adoptions,  :user_id, :admin_user_id
    end
end
