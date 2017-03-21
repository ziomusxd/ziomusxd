class Explo < ActiveRecord::Base
    belongs_to :unit
    has_many :wydanie
    has_many :adoption
    belongs_to :category
    belongs_to :subcategory
    belongs_to :subsubcategory
    
    validates :unit_id, :name, :sn, :polka, :regal, presence: true
    validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
    
    #has_attached_file :avatar, :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
    #validates_attachment :avatar, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }

    has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    def self.search(search)
      if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
    end
end
