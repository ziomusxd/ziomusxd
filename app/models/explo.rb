class Explo < ActiveRecord::Base
    belongs_to :unit
    has_many :wydanie
    has_many :adoption
    
    validates :quantity, :unit_id, :name, :sn, :polka, :regal, presence: true
    


    def self.search(search)
      where("sn LIKE ?", "%#{search}%")
    end
end
