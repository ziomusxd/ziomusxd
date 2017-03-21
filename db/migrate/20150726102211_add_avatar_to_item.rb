class AddAvatarToItem < ActiveRecord::Migration
  def change
    
    def up
      add_attachment :items, :avatar
    end

    def down
      remove_attachment :items, :avatar
    end
    
  end
end
