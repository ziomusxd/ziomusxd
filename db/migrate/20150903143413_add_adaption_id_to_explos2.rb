class AddAdaptionIdToExplos2 < ActiveRecord::Migration
  def change
    add_column :explos, :adoption_id, :integer
  end
end
