class Wz < ActiveRecord::Base
    belongs_to :user
    belongs_to :item
    belongs_to :location
    belongs_to :status
    
    validates :user_id, :item_id, :location_id, :status, :description, :admin_user_id, presence: true
    
end
