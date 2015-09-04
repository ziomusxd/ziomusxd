class RemoveHallFromJtems < ActiveRecord::Migration
  def change
    remove_column :items, :city, :proffesion, :hall
 
 
  end
end
