class Unit < ActiveRecord::Base
     has_many :explos
     has_many :items
     has_many :adoptions

     validates :name, :unit, presence: true
     

end
