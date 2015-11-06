class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :accident
  belongs_to :status
  
#    validates :description, :status_id, presence: true

end
