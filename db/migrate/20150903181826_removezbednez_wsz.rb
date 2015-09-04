class RemovezbednezWsz < ActiveRecord::Migration
  def change
    remove_column :wzs, :where
    remove_column :wzs, :quantity
    add_column :wzs, :location_id, :integer
  end
end
