class Accident < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  belongs_to :status
  has_many :action

  validates :location_id, presence: true

end
