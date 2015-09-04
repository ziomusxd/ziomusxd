class AddAdaptionIdToExplos < ActiveRecord::Migration
  def change
    add_column :explos, :adaption_id, :integer
  end
end
