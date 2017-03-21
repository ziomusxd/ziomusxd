class Location < ActiveRecord::Base
     has_many :items
     has_many :wzs
     has_many :accidents
     
     validates :name, :hall, :city, :adress, presence: true
     
end
