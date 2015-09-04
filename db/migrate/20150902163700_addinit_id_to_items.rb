class AddinitIdToItems < ActiveRecord::Migration
    def change
       add_column :items, :unit_id, :integer
       add_column :items, :location_id, :integer
     end
end
