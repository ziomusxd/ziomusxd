class Wz < ActiveRecord::Base
    belongs_to :user
    belongs_to :item
    belongs_to :location
    belongs_to :admin_user
    belongs_to :status
    
    validates :user_id, :item_id, :location_id, :admin_user_id, :status, presence: true
    
end
