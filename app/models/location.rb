class Location < ActiveRecord::Base
     has_many :item
     has_many :wz
     
     validates :name, :hall, :city, :adress, presence: true
     
end
