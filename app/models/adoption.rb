class Adoption < ActiveRecord::Base
  belongs_to :user
  belongs_to :explo
  belongs_to :unit
  
  validates :quantity, :explo, presence: true


end
