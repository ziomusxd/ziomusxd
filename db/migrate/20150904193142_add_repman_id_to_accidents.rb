class AddRepmanIdToAccidents < ActiveRecord::Migration
  def change
    add_column :accidents, :repman_id, :integer
  end
end
