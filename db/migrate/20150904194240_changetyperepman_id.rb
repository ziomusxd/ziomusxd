class ChangetyperepmanId < ActiveRecord::Migration
    def up
        change_column :accidents, :repman_id, :string
      end

    def down
        change_column :accidents, :repman_id, :integer
   end
end
