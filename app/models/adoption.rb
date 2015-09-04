class Adoption < ActiveRecord::Base
  #belongs_to :admin_user
  belongs_to :explo
  belongs_to :unit
  
  validates :quantity, presence: true


end
