class AddExploIdToExplos < ActiveRecord::Migration
  def change
        add_column :explos, :explo_id, :integer
  end
end
