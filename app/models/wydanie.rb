class Wydanie < ActiveRecord::Base
    belongs_to :explo
    belongs_to :user
    
    
    validates :explo_id, :user_id, :quantity, presence: true
    
    
    
end
