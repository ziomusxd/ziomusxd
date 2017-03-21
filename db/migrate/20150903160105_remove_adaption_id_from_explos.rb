class RemoveAdaptionIdFromExplos < ActiveRecord::Migration
  def change
        remove_column :explos, :adaption_id
  end
end
