class RemoveHallFromJtems2 < ActiveRecord::Migration
  def change

    remove_column :items, :proffesion
    remove_column :items, :hall
      
  end
end
