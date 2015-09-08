class Explo < ActiveRecord::Base
    belongs_to :unit
    has_many :wydanie
    has_many :adoption
    belongs_to :category
    belongs_to :subcategory
    belongs_to :subsubcategory
    
    validates :unit_id, :name, :sn, :polka, :regal, presence: true
    validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }


    def self.search(search)
      where("sn LIKE ?", "%#{search}%")
    end
end
